defmodule BdPro.SessionController do
  use BdPro.Web, :controller
  alias BdPro.User

  plug :scrub_params, "session" when action in [:create, :update]

  def show(conn, _params) do
    if (conn.assigns[:current_user]) do
      render conn, BdPro.SessionView, "show.json", session: %{user: conn.assigns[:current_user]}
    else
      conn
      |> put_status(:not_found)
      |> render(BdPro.ErrorView, "404.json")
    end
  end

  def create(conn, %{"session" => session}) do
    case User.Query.find_by_email(session["email"]) do
      (nil) ->
        conn
          |> put_status(:not_found)
          |> render(BdPro.ErrorView, "404.json")
      (user) ->
        case User.authenticate(user, session["password"]) do
          (:ok) ->
            conn
              |> put_session(:user_id, user.id)
              |> render BdPro.SessionView, "show.json", session: %{user: user}
          (:error) ->
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
