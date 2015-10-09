defmodule BdPro.CampaignReportPage do
  use BdPro.Page

  def visit(campaign) do
    IO.inspect campaign.id
    navigate_to("/campaigns/#{campaign.id}/report")
  end

  def visit(campaign, options \\ []) do
    navigate_to("/campaigns/#{campaign.id}/report?startDate=#{options[:start_date]}&endDate=#{options[:end_date]}")
  end

  def has_campaign?(campaign) do
    find_element(:class, "qa-campaign-name") && visible_text(find_element(:class, "qa-campaign-name")) == campaign.name
  end

  def has_median_income?(number) do
    has_css?(".qa-median-income", %{text: Integer.to_string(number)})
  end
end
