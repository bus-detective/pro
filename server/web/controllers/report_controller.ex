defmodule BdPro.ReportController do
  use BdPro.Web, :controller

  alias BdPro.Report

  def show(conn, %{"id" => campaign_id}) do
    render conn, report: Report.generate(campaign_id: campaign_id)
  end
end
