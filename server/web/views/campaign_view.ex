defmodule BdPro.CampaignView do
  use BdPro.Web, :view

  def render("index.json", %{campaigns: campaigns}) do
    vehicles = Enum.flat_map(campaigns, &(&1.vehicles))
    %{
      campaigns: render_many(campaigns, BdPro.CampaignView, "campaign.json"),
      vehicles: render_many(vehicles, BdPro.VehicleView, "vehicle.json")
    }
  end

  def render("show.json", %{campaign: campaign}) do
    %{
      campaign: render_one(campaign, BdPro.CampaignView, "campaign.json"),
      vehicles: render_many(campaign.vehicles, BdPro.VehicleView, "vehicle.json")
    }
  end

  def render("campaign.json", %{campaign: campaign}) do
    %{
      id: campaign.id,
      name: campaign.name,
      vehicle_ids: Enum.map(campaign.vehicles, &(&1.id))
    }
  end
end
