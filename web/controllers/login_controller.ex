defmodule Arteesan.LoginController do
  use Arteesan.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do

  end
end
