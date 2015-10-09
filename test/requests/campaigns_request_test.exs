defmodule BdPro.CampaignsRequestTest do
  use BdPro.ConnCase

  alias BdPro.Campaign
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, campaign_path(conn, :index)
    assert json_response(conn, 200)["campaigns"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    campaign = Repo.insert! %Campaign{}
    conn = get conn, campaign_path(conn, :show, campaign)
    assert json_response(conn, 200)["campaign"]["id"] == campaign.id
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, campaign_path(conn, :show, -1)
    end
  end
end
