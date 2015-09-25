defmodule BdPro.CampaignIndexPage do
  use BdPro.Page

  def visit do
    navigate_to("/")
  end

  def has_campaign?(campaign) do
    has_css?(".qa-campaign-#{campaign.id}")
  end

  def create_campaign do
    click({:class, "qa-create-campaign"})
  end

  def edit_campaign(campaign) do
    edit_element = find_element(:class, "qa-edit-campaign-#{campaign.id}")
    click(find_within_element(edit_element, :link_text, "Edit"))
  end

  def campaign_count do
    Enum.count(campaigns)
  end

  defp campaigns do
    find_all_elements(:class, "qa-campaign")
  end
end
