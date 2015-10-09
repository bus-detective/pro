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
      {:ok, user} -> user_authenticate(conn, user, session["password"])
      {:error, error} -> handle_error(conn, error)
    end
  end

  def delete(conn, _params) do
    conn
    |> put_session(:user_id, nil)
    |> send_resp(:no_content, "")
  end

  defp user_authenticate(conn, user, password) do
    case User.authenticate(user, password) do
      {:ok} ->
        conn
        |> put_session(:user_id, user.id)
        |> render BdPro.SessionView, "show.json", session: %{user: user}
      {:error, error} -> handle_error(conn, error)
    end
  end

  defp handle_error(conn, :not_found) do
    conn
    |> put_status(:not_found)
    |> render(BdPro.ErrorView, "404.json")
  end
  
  defp handle_error(conn, :unauthorized) do
    conn
    |> put_status(:unauthorized)
    |> render(BdPro.ErrorView, "403.json")
  end
end
