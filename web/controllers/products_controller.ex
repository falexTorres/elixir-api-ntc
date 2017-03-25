defmodule ApiTry.ProductsController do
  use ApiTry.Web, :controller

  alias ApiTry.Products

  def index(conn, _params) do
    product = Repo.all(Products)
    render(conn, "index.json", product: product)
  end

  def create(conn, %{"products" => products_params}) do
    changeset = Products.changeset(%Products{}, products_params)

    case Repo.insert(changeset) do
      {:ok, products} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", products_path(conn, :show, products))
        |> render("show.json", products: products)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ApiTry.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    products = Repo.get!(Products, id)
    render(conn, "show.json", products: products)
  end

  def update(conn, %{"id" => id, "products" => products_params}) do
    products = Repo.get!(Products, id)
    changeset = Products.changeset(products, products_params)

    case Repo.update(changeset) do
      {:ok, products} ->
        render(conn, "show.json", products: products)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ApiTry.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    products = Repo.get!(Products, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(products)

    send_resp(conn, :no_content, "")
  end
end
