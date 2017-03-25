defmodule ApiTry.ProductsTest do
  use ApiTry.ModelCase

  alias ApiTry.Products

  @valid_attrs %{description: "some content", name: "some content", price: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Products.changeset(%Products{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Products.changeset(%Products{}, @invalid_attrs)
    refute changeset.valid?
  end
end
