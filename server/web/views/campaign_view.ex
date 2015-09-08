defmodule BdPro.CampaignView do
  use BdPro.Web, :view

  def render("index.json", %{campaigns: campaigns}) do
    %{campaigns: render_many(campaigns, BdPro.CampaignView, "campaign.json")}
  end

  def render("show.json", %{campaign: campaign}) do
    %{campaign: render_one(campaign, BdPro.CampaignView, "campaign.json")}
  end

  def render("campaign.json", %{campaign: campaign}) do
    %{
      id: campaign.id,
      name: campaign.name
    }
  end
end
