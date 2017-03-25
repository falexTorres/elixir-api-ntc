defmodule ApiTry.User do
  use ApiTry.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string
    field :role, :string
    timestamps()
  end
  
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :role])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
