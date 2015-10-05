defmodule BdPro.ManagingCampaignsFeature do
  use BdPro.FeatureCase
  alias BdPro.CampaignIndexPage
  alias BdPro.CampaignReportPage
  alias BdPro.ManageCampaignPage

  setup do
    {:ok, %{campaign: BdPro.CampaignFactory.create}}
  end

  test "Viewing all campaigns", %{campaign: campaign} do
    CampaignIndexPage.visit
    IO.inspect campaign
    assert CampaignIndexPage.has_campaign?(campaign)
  end

  test "Viewing a campaign report", %{campaign: campaign} do
    CampaignReportPage.visit(campaign)
    assert CampaignReportPage.has_campaign?(campaign)
  end

  test "Creating a campaign", %{campaign: campaign} do
    new_campaign_attrs = %{name: 'New Campaign'}
    CampaignIndexPage.visit
    CampaignIndexPage.create_campaign
    ManageCampaignPage.add_attributes_and_save(new_campaign_attrs)
    assert CampaignIndexPage.has_campaign?(campaign)
  end

  test "Delete a new campaign" do
    campaign_count = CampaignIndexPage.campaign_count
    CampaignIndexPage.visit
    CampaignIndexPage.create_campaign
    ManageCampaignPage.delete
    assert CampaignIndexPage.campaign_count == campaign_count
  end

  test "Editing a campaign", %{campaign: campaign} do
    new_campaign_attrs = %{name: 'Edited Campaign'}
    CampaignIndexPage.visit
    CampaignIndexPage.edit_campaign(campaign)
    ManageCampaignPage.add_attributes_and_save(new_campaign_attrs)
    assert CampaignIndexPage.has_campaign?(campaign)
  end

  test "Delete a campaign", %{campaign: campaign} do
    campaign_count = CampaignIndexPage.campaign_count
    CampaignIndexPage.visit
    CampaignIndexPage.delete(campaign)
    assert CampaignIndexPage.campaign_count == campaign_count
  end

  test "Error messages display", %{campaign: campaign} do
    new_campaign_attrs = %{name: ''}
    CampaignIndexPage.visit
    CampaignIndexPage.create_campaign
    ManageCampaignPage.add_attributes_and_save(new_campaign_attrs)
    assert ManageCampaignPage.has_error?
  end
end
