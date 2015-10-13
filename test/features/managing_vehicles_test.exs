defmodule BdPro.ManagingVehiclesFeature do
  use BdPro.FeatureCase
  import BdPro.Factories
  alias BdPro.CampaignIndexPage
  alias BdPro.CampaignEditPage

  setup do
    {:ok, user: sign_in_generic_user}
  end

  setup do
    {:ok, campaign: create(:campaign) }
  end

  setup do
    {:ok, vehicle_position: create(:vehicle_position)}
  end

  setup %{campaign: campaign, vehicle_position: vehicle_position} do
    {:ok, vehicle: create(:vehicle, campaign: campaign, remote_id: vehicle_position.vehicle_remote_id)}
  end

  test "Viewing vehicle count on a campaign", %{campaign: campaign} do
    CampaignIndexPage.visit
    assert CampaignIndexPage.has_campaign?(campaign)
    assert CampaignIndexPage.vehicle_count(campaign) == "1 Vehicles"
  end

  test "Adding vehicles to a campaign", %{campaign: campaign} do
    vp = create(:vehicle_position)
    CampaignEditPage.visit(campaign)
    CampaignEditPage.add_vehicle_and_save(%{remote_id: vp.vehicle_remote_id, product: "Kong Wrap"})
    assert CampaignEditPage.vehicle_count == 3
  end

  test "Delete vehicles from a campaign", %{campaign: campaign, vehicle: vehicle} do
    CampaignEditPage.visit(campaign)
    CampaignEditPage.delete_vehicle(vehicle)
    assert CampaignEditPage.vehicle_count == 1
  end

  test "Editing a vehicle", %{campaign: campaign, vehicle: vehicle} do
    vp = create(:vehicle_position)
    new_vehicle_attrs = %{remote_id: vp.vehicle_remote_id, product: "King Kong Wrap"}
    CampaignEditPage.visit(campaign)
    CampaignEditPage.edit_vehicle_and_save(vehicle, new_vehicle_attrs)
    assert CampaignEditPage.has_updated_vehicle?(vehicle, new_vehicle_attrs)
  end

  test "Error messages display", %{campaign: campaign, vehicle: vehicle} do
    CampaignEditPage.visit(campaign)
    CampaignEditPage.edit_vehicle_and_save(vehicle, %{remote_id: "", product: "King Kong Wrap"})
    assert CampaignEditPage.has_error?
  end
end
