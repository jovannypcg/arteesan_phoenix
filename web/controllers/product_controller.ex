defmodule Arteesan.ProductController do
  use Arteesan.Web, :controller

  alias Arteesan.Product

  def index(conn, _params) do
    products = Repo.all Product

    render conn, "index.html", products: products
  end

  def new(conn, _params) do
    changeset = Product.changeset(%Product{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product" => product}) do
    product = path_from_file_plug(product)
    changeset = Product.changeset(%Product{}, product)

    case Repo.insert(changeset) do
      { :ok, saved_product } ->
        conn
        |> put_flash(:info, "¡#{saved_product.title} agregado!")
        |> redirect(to: product_path(conn, :index))
      { :error, err_changeset } ->
        conn
        |> render("new.html", changeset: err_changeset)
    end

    render(conn, "new.html", changeset: changeset)
  end

  defp path_from_file_plug(product) do
    case product["thumbnail"] do
      nil -> product
      thumbnail ->
        %{ product | "thumbnail" => thumbnail.path }
    end
  end
end
