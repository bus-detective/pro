defmodule BdPro.CampaignIndexPage do
  use BdPro.Page

  def visit do
    navigate_to("/campaigns")
  end

  def has_campaign?(campaign) do
    has_css?(".qa-campaign-#{campaign.id}")
  end
end
