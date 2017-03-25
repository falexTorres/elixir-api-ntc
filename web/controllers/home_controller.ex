defmodule ApiTry.HomeController do
  use ApiTry.Web, :controller  
  use Guardian.Phoenix.Controller
  plug Guardian.Plug.EnsureAuthenticated, handler: ApiTry.UnauthenticatedController

  def index(conn, _, user, _) do
      conn = put_view(conn, ApiTry.HomeView)
      jwt = Guardian.Plug.current_token(conn)
      #render(conn, "index.json", id: params.id)
      if jwt do
            conn
            |> render("index.json", user: user)    
      else
            conn
            |> render("error.json", message: "not logged in")
      end
  end
end