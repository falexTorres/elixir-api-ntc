defmodule ApiTry.Products do
  use ApiTry.Web, :model

  schema "products" do
    field :name, :string
    field :price, :string
    field :description, :string

    timestamps()
  end
  
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :price, :description])
    |> validate_required([:name, :price, :description])
  end
end
