defmodule ApiTry.ProductsView do
  use ApiTry.Web, :view

  def render("index.json", %{product: product}) do
    %{data: render_many(product, ApiTry.ProductsView, "products.json")}
  end

  def render("show.json", %{products: products}) do
    %{data: render_one(products, ApiTry.ProductsView, "products.json")}
  end

  def render("products.json", %{products: products}) do
    %{id: products.id,
      name: products.name,
      price: products.price,
      description: products.description}
  end
end
