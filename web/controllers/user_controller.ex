defmodule Arteesan.UserController do
  use Arteesan.Web, :controller

  alias Arteesan.User

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user}) do
    changeset = User.changeset(%User{}, user)

    case Repo.insert(changeset) do
      { :ok, saved_user } ->
        conn
        |> put_flash(:info, "Your account was created")
        |> redirect(to: "/")
      { :error, err_changeset } ->
        render conn, "new.html", changeset: err_changeset
    end
  end
end
