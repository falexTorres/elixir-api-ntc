defmodule ApiTry.UnauthenticatedView do
    use ApiTry.Web, :view

    def render("error.json", %{message: message}) do
        %{
            message: message
        }
    end
end