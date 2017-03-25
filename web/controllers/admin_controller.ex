defmodule ApiTry.AdminController do
  use ApiTry.Web, :controller  
  use Guardian.Phoenix.Controller
  alias ApiTry.Constants
  plug Guardian.Plug.EnsureAuthenticated, handler: ApiTry.UnauthenticatedController

  def index(conn, params, user, claims) do
    service_permissions = Guardian.Permissions.from_claims(claims, :service_admin)
    case Guardian.Permissions.all?(
      service_permissions,
      Constants.service_admin(), 
      :service_admin
    ) do
      true ->
        conn
        |> render("admin.json", data: user)
      false ->
        ApiTry.UnauthorizedController.unauthorized(conn, params)
      _ ->
        ApiTry.UnauthorizedController.unauthorized(conn, params)  
    end
  end
end