defmodule BdPro.CampaignReportPage do
  use BdPro.Page

  def visit(campaign) do
    navigate_to("/campaigns/#{campaign.id}/report")
  end

  def has_campaign?(campaign) do
    has_content?("#{campaign.name}")
  end
end
