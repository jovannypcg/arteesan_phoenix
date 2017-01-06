defmodule Arteesan.AuthController do
  use Arteesan.Web, :controller
  plug Ueberauth

  alias Arteesan.User

  def callback(conn, %{"provider" => provider}) do
    case provider do
      "github" -> github_signin(conn)
    end
  end

  defp github_signin(%{assigns: %{ueberauth_auth: auth}} = conn) do
    user_params = %{
      token: auth.credentials.token,
      email: auth.info.email,
      first_name: auth.info.name,
      provider: "GITHUB"
    }

    changeset = User.github_changeset(%User{}, user_params)

    signin(conn, changeset)
  end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      { :ok, user } ->
        conn
        |> put_flash(:info, "¡Bienvenido #{user.first_name}!")
        |> put_session(:user_id, user.id)
        |> redirect(to: product_path(conn, :index))
      { :error, _reason } ->
        conn
        |> put_flash(:error, "Error al ingresar")
        |> redirect(to: product_path(conn, :index))
    end
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil -> Repo.insert(changeset)
      user -> { :ok, user }
    end
  end
end
