defmodule BdPro.DemographicsRequestTest do
  use BdPro.ConnCase
  import BdPro.Factories

  alias BdPro.Campaign

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  setup do
    campaign = create(:campaign)
    vehicle = create(:vehicle, campaign: campaign)
    create(:vehicle_position, vehicle: vehicle)
    {:ok, campaign: campaign}
  end

  test "index returns a list of demographics for the campaign", %{conn: conn, campaign: campaign} do
    conn = get conn, demographic_path(conn, :index, campaign_id: campaign.id, start_date: "2015-01-01", end_date: "2015-02-02")
    first_demographic = hd(json_response(conn, 200)["demographics"])
    assert first_demographic["average_income"] == 1000
  end
end
