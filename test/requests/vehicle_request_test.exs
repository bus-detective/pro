defmodule BdPro.VehicleRequestTest do
  use BdPro.ConnCase
  import BdPro.Factories

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  setup do
    {:ok, campaign: create(:campaign)}
  end

  setup do
    {:ok, vehicle_position: create(:vehicle_position)}
  end

  test "error when creating a vehicle that doesn't exist in vehicle positions", %{conn: conn, campaign: campaign} do
    conn = post conn, vehicle_path(conn, :create, %{"vehicle" => %{campaign_id: campaign.id, remote_id: "does_not_exist", product: "product"}})
    assert json_response(conn, 422)["errors"]["remote_id"] == ["Not a valid Vehicle ID"]
  end

  test "ok when creating a vehicle that exists in vehicle positions", %{conn: conn, campaign: campaign, vehicle_position: vehicle_position} do
    conn = post conn, vehicle_path(conn, :create, %{"vehicle" => %{campaign_id: campaign.id, remote_id: vehicle_position.vehicle_remote_id, product: "product"}})
    assert json_response(conn, 200)
  end
end
