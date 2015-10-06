defmodule BdPro.CampaignReportFeature do
  use BdPro.FeatureCase
  import BdPro.Factories
  alias BdPro.CampaignReportPage

  setup do
    {:ok, timestamp} = Ecto.DateTime.cast({{2015, 01, 01}, {0,0,0}})
    campaign = create(:campaign)
    tract = create(:tract)
    vehicle = create(:vehicle, campaign: campaign)
    create(:vehicle_position, vehicle: vehicle, timestamp: timestamp)
    create(:demographic, tract_id: tract.id, income_median: 999)
    {:ok, %{campaign: campaign}}
  end

  test "Viewing a campaign report", %{campaign: campaign} do
    CampaignReportPage.visit(campaign, start_date: "2015-01-01", end_date: "2015-02-02")
    assert CampaignReportPage.has_median_income?(999)
  end
end
