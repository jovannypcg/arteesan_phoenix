defmodule Arteesan.SessionController do
  use Arteesan.Web, :controller

  alias Arteesan.User

  def new(conn, _params) do
    changeset = User.session_changeset(%User{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user}) do
    changeset = User.session_changeset(%User{}, user)

    case signin(changeset) do
        { :ok, stored_user } ->
          conn
          |> put_flash(:info, "¡Bienvenido #{stored_user.first_name}!")
          |> put_session(:user_id, stored_user.id)
          |> redirect(to: product_path(conn, :index))
        { :error, reason } ->
          conn
          |> put_flash(:error, reason)
          |> redirect(to: session_path(conn, :new))
    end
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: product_path(conn, :index))
  end

  defp signin(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil -> { :error, "Correo o contraseña incorrectos" }
      stored_user -> user_comparison(changeset, stored_user)
    end
  end

  defp user_comparison(changeset, stored_user) do
    password_match? = stored_user.password == changeset.changes.password

    cond do
      !stored_user.active -> { :error, "Usuario inactivo" }
      stored_user.active && password_match? -> { :ok, stored_user }
      true -> { :error, "Correo o contraseña incorrectos" }
    end
  end
end
