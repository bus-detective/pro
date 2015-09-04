defmodule BdPro.CampaignShowPage do
  alias BdPro.Page
  use Hound.Helpers

  def visit do
    navigate_to("/campaigns/1")
  end

  def has_campaign?() do
    Page.has_content?("Campaign")
  end
end
