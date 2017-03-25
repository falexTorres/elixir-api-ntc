defmodule ApiTry.Router do
  use ApiTry.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.LoadResource
  end

  pipeline :api_auth do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    #plug Guardian.Plug.EnsureAuthenticated, handler: ApiTry.UnauthenticatedController 
    plug Guardian.Plug.LoadResource  
  end

  scope "/", ApiTry do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # logged out requests
  scope "/api", ApiTry do
    pipe_through :api
    post "/login", LoginController, :login
    resources "/products", ProductsController, except: [:new, :edit]
  end

  # logged in requests
  scope "/api", ApiTry do
    pipe_through :api_auth
    get "/home", HomeController, :index
    post "/logout", LogoutController, :logout
    resources "/users", UserController, except: [:new, :edit]
    get "/admin", AdminController, :index
  end
end
