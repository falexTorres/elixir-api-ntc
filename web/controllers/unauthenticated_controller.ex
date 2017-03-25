defmodule ApiTry.UnauthenticatedController do
    use ApiTry.Web, :controller
    use Guardian.Phoenix.Controller
 
    def unauthenticated(conn, _) do
        conn = put_view(conn, ApiTry.UnauthenticatedView)
        conn
        |> put_status(401)
        |> render("error.json", message: "unauthenticated")
    end
end