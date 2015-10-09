defmodule BdPro.ManagingCampaignsFeature do
  use BdPro.FeatureCase
  alias BdPro.CampaignIndexPage
  alias BdPro.CampaignEditPage

  setup do
    {:ok, user: sign_in_generic_user}
  end

  setup do
    {:ok, campaign: create(:campaign) }
  end

  test "Viewing all campaigns", %{campaign: campaign} do
    CampaignIndexPage.visit
    assert CampaignIndexPage.has_campaign?(campaign)
  end

  test "Creating a campaign", %{campaign: campaign} do
    CampaignIndexPage.visit
    CampaignIndexPage.create_campaign
    CampaignEditPage.add_attributes_and_save(%{name: 'New Campaign'})
    assert CampaignIndexPage.has_campaign?(campaign)
  end

  test "Editing a campaign", %{campaign: campaign} do
    CampaignEditPage.visit(campaign)
    CampaignEditPage.add_attributes_and_save(%{name: 'Edited Campaign'})
    assert CampaignIndexPage.has_campaign?(campaign)
  end

  test "Delete a campaign", %{campaign: campaign} do
    CampaignEditPage.visit(campaign)
    CampaignEditPage.delete
    CampaignIndexPage.visit_page
    assert CampaignIndexPage.campaign_count == 0
  end

  test "Error messages display" do
    CampaignIndexPage.visit
    CampaignIndexPage.create_campaign
    CampaignEditPage.add_attributes_and_save(%{name: ''})
    assert CampaignEditPage.has_error?
  end
end
