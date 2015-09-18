defmodule BdPro.ViewingCampaignReportsFeature do
  use BdPro.FeatureCase
  alias BdPro.CampaignReportPage

  setup do
    {:ok, campaign} = Repo.insert(%BdPro.Campaign{name: "My test campaign"})
    {:ok, %{campaign: campaign}}
  end

  test "Navigating to the app.", %{campaign: campaign} do
    CampaignReportPage.visit(campaign)
    assert CampaignReportPage.has_campaign?(campaign)
  end
end
