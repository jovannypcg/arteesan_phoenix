defmodule Arteesan.SessionController do
  use Arteesan.Web, :controller

  alias Arteesan.User

  def new(conn, _params) do
    changeset = User.session_changeset(%User{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user}) do
    changeset = User.session_changeset(%User{}, user)

    case changeset.valid? do
      true ->
        conn
        |> put_flash(:info, "Welcome")
        |> redirect(to: "/")
      false ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
