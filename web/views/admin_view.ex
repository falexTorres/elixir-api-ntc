defmodule ApiTry.AdminView do
  use ApiTry.Web, :view

  def render("admin.json", %{data: user}) do
    %{
      message: "accepted to admin page"
    }
  end
end