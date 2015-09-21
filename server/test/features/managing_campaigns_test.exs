defmodule BdPro.ManagingCampaignsFeature do
  use BdPro.FeatureCase
  alias BdPro.CampaignIndexPage
  alias BdPro.CampaignReportPage

  setup do
    {:ok, %{campaign: BdPro.CampaignFactory.create}}
  end

  test "Viewing all campaigns", %{campaign: campaign} do
    CampaignIndexPage.visit
    assert CampaignIndexPage.has_campaign?(campaign)
  end

  test "Viewing a campaign", %{campaign: campaign} do
    CampaignReportPage.visit(campaign)
    assert CampaignReportPage.has_campaign?(campaign)
  end
end

