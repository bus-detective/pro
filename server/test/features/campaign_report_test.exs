defmodule BdPro.CampaignReportFeature do
  use BdPro.FeatureCase
  alias BdPro.CampaignReportPage

  setup do
    {:ok, %{campaign: BdPro.CampaignFactory.create}}
  end

  setup do
    {:ok, %{tract: BdPro.TractFactory.create}}
  end

  test "Viewing a campaign report", %{campaign: campaign, tract: tract} do
    CampaignReportPage.visit(campaign)
    assert CampaignReportPage.have_tract_count?(tract, 3)
  end
end
