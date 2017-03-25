defmodule ApiTry.LoginView do
  use ApiTry.Web, :view

  def render("login.json", %{user: user, jwt: jwt}) do
    %{
      id: user.id,
      jwt: jwt
    }
  end

  def render("error.json", %{message: message}) do
    %{
      message: message
    }
  end
end