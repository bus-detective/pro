defmodule BdPro.ManagingVehiclesFeature do
  use BdPro.FeatureCase
  alias BdPro.CampaignIndexPage
  alias BdPro.ManageCampaignPage

  setup do
    {:ok, %{campaign: BdPro.CampaignFactory.create}}
  end

  setup %{campaign: campaign} do
    {:ok, %{vehicle: BdPro.VehicleFactory.create(campaign_id: campaign.id )}}
  end

  test "Viewing vehicle count on a campaign", %{campaign: campaign} do
    CampaignIndexPage.visit
    assert CampaignIndexPage.has_campaign?(campaign)
    assert CampaignIndexPage.vehicle_count(campaign) == "1 Vehicles"
  end

  test "Adding vehicles to a campaign", %{campaign: campaign} do
    new_vehicle_attrs = %{remote_id: "1234", product: "Kong Wrap"}
    CampaignIndexPage.visit
    CampaignIndexPage.edit_campaign(campaign)
    vehicle_count = ManageCampaignPage.vehicle_count
    ManageCampaignPage.add_vehicle_and_save(new_vehicle_attrs)
    updated_vehicle_count = vehicle_count + 1
    assert ManageCampaignPage.vehicle_count == updated_vehicle_count
  end

  test "Delete vehicles from a campaign", %{campaign: campaign, vehicle: vehicle} do
    CampaignIndexPage.visit
    CampaignIndexPage.edit_campaign(campaign)
    vehicle_count = ManageCampaignPage.vehicle_count
    ManageCampaignPage.delete_vehicle(vehicle)
    updated_vehicle_count = vehicle_count - 1
    assert ManageCampaignPage.vehicle_count == updated_vehicle_count
  end

  test "Editing a vehicle", %{campaign: campaign, vehicle: vehicle} do
    new_vehicle_attrs = %{remote_id: "4321", product: "King Kong Wrap"}
    CampaignIndexPage.visit
    CampaignIndexPage.edit_campaign(campaign)
    ManageCampaignPage.edit_vehicle_and_save(vehicle, new_vehicle_attrs)
    assert ManageCampaignPage.has_updated_vehicle?(vehicle, new_vehicle_attrs)
  end

  test "Error messages display", %{campaign: campaign, vehicle: vehicle} do
    new_vehicle_attrs = %{remote_id: "", product: "King Kong Wrap"}
    CampaignIndexPage.visit
    CampaignIndexPage.edit_campaign(campaign)
    ManageCampaignPage.edit_vehicle_and_save(vehicle, new_vehicle_attrs)
    assert ManageCampaignPage.has_error?
  end
end
