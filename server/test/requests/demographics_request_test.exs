defmodule BdPro.DemographicsRequestTest do
  use BdPro.ConnCase
  import BdPro.Factories

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  setup do
    {:ok, timestamp} = Ecto.DateTime.cast({{2015, 01, 01}, {0,0,0}})
    campaign = create(:campaign)
    tract = create(:tract)
    vehicle = create(:vehicle, campaign: campaign)
    create(:vehicle_position, vehicle: vehicle, timestamp: timestamp)
    create(:demographic, tract_id: tract.id, income_median: 999)
    {:ok, campaign: campaign}
  end

  test "index returns a list of demographics for the campaign", %{conn: conn, campaign: campaign} do
    conn = get conn, demographic_report_path(conn, :index, campaign_id: campaign.id, start_date: "2015-01-01", end_date: "2015-02-02")
    reports = json_response(conn, 200)["demographic_reports"]
    assert hd(reports)["income_median"] == "999"
  end
end
