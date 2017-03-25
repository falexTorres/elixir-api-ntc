defmodule ApiTry.PageController do
  use ApiTry.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
