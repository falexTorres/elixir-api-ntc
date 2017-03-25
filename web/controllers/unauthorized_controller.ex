defmodule ApiTry.UnauthorizedController do
    use ApiTry.Web, :controller
    use Guardian.Phoenix.Controller
 
    def unauthorized(conn, _) do
        conn = put_view(conn, ApiTry.UnauthenticatedView)
        conn
        |> put_status(401)
        |> render("error.json", message: "unauthorized")
    end
end