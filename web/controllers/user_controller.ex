defmodule Arteesan.UserController do
  use Arteesan.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def login(conn, _params) do
    render conn, "login.html"
  end
end
