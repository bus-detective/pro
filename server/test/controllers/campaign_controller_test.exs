defmodule BdPro.CampaignControllerTest do
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
    assert json_response(conn, 200)["campaign"] == %{"id" => campaign.id, "name" => campaign.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, campaign_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, campaign_path(conn, :create), campaign: @valid_attrs
    assert json_response(conn, 201)["campaign"]["id"]
    assert Repo.get_by(Campaign, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, campaign_path(conn, :create), campaign: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    campaign = Repo.insert! %Campaign{}
    conn = put conn, campaign_path(conn, :update, campaign), campaign: @valid_attrs
    assert json_response(conn, 200)["campaign"]["id"]
    assert Repo.get_by(Campaign, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    campaign = Repo.insert! %Campaign{}
    conn = put conn, campaign_path(conn, :update, campaign), campaign: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    campaign = Repo.insert! %Campaign{}
    conn = delete conn, campaign_path(conn, :delete, campaign)
    assert response(conn, 204)
    refute Repo.get(Campaign, campaign.id)
  end
end
