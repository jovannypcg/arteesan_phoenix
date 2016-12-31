defmodule Arteesan.LoginController do
  use Arteesan.Web, :controller

  alias Arteesan.User

  def new(conn, _params) do
    changeset = User.login_changeset(%User{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, params) do
    IO.inspect params
  end
end
