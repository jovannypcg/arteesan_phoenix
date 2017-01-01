defmodule Arteesan.UserController do
  use Arteesan.Web, :controller

  alias Arteesan.User

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def login(conn, _params) do
    render conn, "login.html"
  end

  def create(conn, %{"user" => user}) do
    password = Map.get user, "password"

    safe_password = :crypto.hash(:sha256, password)
    |> Base.encode16
    |> String.downcase

    changeset = User.changeset(%User{}, %{user | "password" => safe_password})

    case Repo.insert(changeset) do
      { :ok, saved_user } -> IO.inspect(saved_user)
      { :error, err_changeset } ->
        render conn, "new.html", changeset: err_changeset
    end
  end
end
