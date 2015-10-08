defmodule BdPro.SessionController do
  use BdPro.Web, :controller
  alias BdPro.User

  plug :scrub_params, "session" when action in [:create, :update]

  def show(conn) do
    session = { }
    render conn, "show.json", session: session
  end

  def create(conn, %{"session" => session}) do
    case User.Query.find_by_email(session["email"]) do
      (nil) ->
        conn
          |> put_status(:not_found)
          |> render(BdPro.ErrorView, "404.json")
      (user) ->
        case User.authenticate(user, session["password"]) do
          {:ok, user} ->
            conn
              |> put_session(:user_id, user.id)
              |> render BdPro.SessionView, "show.json", session: %{user: user}
          {:error, changeset} ->
            conn
              |> put_status(:unauthorized)
              |> render BdPro.ErrorView, "403.json"
        end
    end
  end

  def delete(conn) do
    # delete session
    send_resp conn, :no_content, ""
  end
end
