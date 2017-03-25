defmodule ApiTry.LogoutView do
  use ApiTry.Web, :view

  def render("logout.json", _) do
    %{
      message: 'logout successful'
    }
  end
end