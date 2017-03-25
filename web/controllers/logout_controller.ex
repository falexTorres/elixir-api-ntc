defmodule ApiTry.LogoutController do
  use ApiTry.Web, :controller
  plug Guardian.Plug.EnsureAuthenticated, handler: ApiTry.UnauthenticatedController

    def logout(conn, _params) do
        jwt = Guardian.Plug.current_token(conn)
        {:ok, claims} = Guardian.Plug.claims(conn)
        Guardian.revoke!(jwt, claims)
        render conn, "logout.json"
    end 
end