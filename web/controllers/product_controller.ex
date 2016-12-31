defmodule Arteesan.ProductController do
  use Arteesan.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
