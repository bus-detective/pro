defmodule BdPro.CampaignReportPage do
  alias BdPro.Page
  use Hound.Helpers

  def visit(campaign) do
    navigate_to("/campaigns/#{campaign.id}")
  end

  def has_campaign?(campaign) do
    Page.has_content?("#{campaign.name}")
  end
end
