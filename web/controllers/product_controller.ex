defmodule Arteesan.ProductController do
  use Arteesan.Web, :controller

  alias Arteesan.Product

  def index(conn, _params) do
    products = Repo.all Product

    render conn, "index.html", products: products
  end

  def new(conn, _params) do

  end
end
