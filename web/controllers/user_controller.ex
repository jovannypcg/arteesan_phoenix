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

  def create(conn, params) do

  end
end
