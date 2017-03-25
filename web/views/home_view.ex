defmodule ApiTry.HomeView do
  use ApiTry.Web, :view

  def render("index.json", %{user: user}) do
    %{
      id: user.id
    }
  end

  def render("error.json", %{message: message}) do
    %{
      message: message
    }
  end
end