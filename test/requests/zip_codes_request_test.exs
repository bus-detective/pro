defmodule BdPro.ZipCodesRequestTest do
  use BdPro.ConnCase
  import BdPro.Factories

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  setup do
    {:ok, timestamp} = Ecto.DateTime.cast({{2015, 01, 01}, {0,0,0}})
    campaign = create(:campaign)
    vehicle = create(:vehicle, campaign: campaign)
    create(:zip_code, zip_code: "12345")
    create(:vehicle_position, vehicle: vehicle, timestamp: timestamp)
    {:ok, campaign: campaign}
  end

  test "index returns a list of zip codes for the campaign", %{conn: conn, campaign: campaign} do
    conn = get conn, zip_code_path(conn, :index, campaign_id: campaign.id, start_date: "2015-01-01", end_date: "2015-02-02")
    zip_codes = json_response(conn, 200)["zip_codes"]
    assert %{"zip_code" => "12345", "count" => 1} = hd(zip_codes)
  end
end
