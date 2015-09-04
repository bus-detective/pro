defmodule BdPro.ManagingCampaigns do
  use BdPro.FeatureCase

  test "Viewing a campaign" do
    BdPro.CampaignShowPage.visit
    assert BdPro.CampaignShowPage.has_campaign?
  end
end

