defmodule BdPro.SessionRequestTest do
  use BdPro.ConnCase
  import BdPro.Factories

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  setup do
    user = create(:user)
    {:ok, user: user}
  end

  test "with an email that does not match", %{conn: conn} do
    conn = post conn, session_path(conn, :create, session: %{email: "does_not_exist@example.com", password: "password"})
    assert json_response(conn, 404)
  end

  test "with a password that doesn't match", %{conn: conn, user: user} do
    conn = post conn, session_path(conn, :create, session: %{email: user.email, password: "invalid_password"})
    assert json_response(conn, 401)
  end

  test "with a password that matches", %{conn: conn, user: user} do
    conn = post conn, session_path(conn, :create, session: %{email: user.email, password: "password"})
    assert json_response(conn, 200)["session"]["user_id"] == user.id
  end
end
