defmodule BdPro.VehiclePositionsRequestTest do
  use BdPro.ConnCase

  alias BdPro.Campaign
  alias BdPro.Vehicle
  alias BdPro.VehiclePosition

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all vehicle positions for a given campaign", %{conn: conn} do
    {:ok, campaign} = Repo.insert(%Campaign{})
    {:ok, vehicle} = Repo.insert(%Vehicle{campaign_id: campaign.id, remote_id: "1234"})
    {:ok, vehicle_position} = Repo.insert(%VehiclePosition{vehicle: vehicle, vehicle_remote_id: "1234", timestamp: Ecto.DateTime.local})

    conn = get conn, vehicle_position_path(conn, :index, %{campaign_id: campaign.id})
    vehicle_postions = json_response(conn, 200)["vehicle_positions"]
    assert Enum.count(vehicle_postions) == 1
  end
end
