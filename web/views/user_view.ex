defmodule ApiTry.UserView do
  use ApiTry.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, ApiTry.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, ApiTry.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      password: user.password}
  end
end
