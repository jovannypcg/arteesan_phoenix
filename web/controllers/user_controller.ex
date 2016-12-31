defmodule Arteesan.UserController do
  use Arteesan.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end
