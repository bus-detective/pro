defmodule BdPro.CampaignReportPage do
  use BdPro.Page

  def visit(campaign) do
    navigate_to("/campaigns/#{campaign.id}/report")
  end

  def visit(campaign, options \\ []) do
    navigate_to("/campaigns/#{campaign.id}/report?startDate=#{options[:start_date]}&endDate=#{options[:end_date]}")
  end

  def has_campaign?(campaign) do
    has_content?("#{campaign.name}")
  end

  def has_median_income?(number) do
    has_css?(".qa-median-income", %{text: Integer.to_string(number)})
  end
end
