defmodule ApiTry.LoginController do
  use ApiTry.Web, :controller
  alias ApiTry.User
  
  @doc """
    looks for session associated with request, if no session the function will
    check for correct login. if correct login then the function will create
    a session for the request.  
  """
  def login(conn, %{"email" => email, "password" => password}) do
    case find_and_confirm_password(%{email: email, password: password}) do
      %User{role: "user"} = user ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :access, perms: %{user: Guardian.Permissions.max})
        conn
        |> render("login.json", user: user, jwt: jwt)
      %User{role: "service_admin"} = user ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :access, perms: %{service_admin: Guardian.Permissions.max})
        conn
        |> render("login.json", user: user, jwt: jwt)
      %User{role: "system_admin"} = user ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :access, perms: %{system_admin: Guardian.Permissions.max})
        conn
        |> render("login.json", user: user, jwt: jwt)
      _ ->
        conn
        |> put_status(401)
        |> render("error.json", message: "could not login")
    end
  end

  @doc """
  Accepts either username and password or user_id and returns
  {:ok, user} if user is found and {:error, changeset} if not found.
  """
  defp find_and_confirm_password(params) do
    Repo.get_by(User, %{email: params.email, password: params.password})  
  end
end