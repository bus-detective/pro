defmodule BdPro.ReportController do
  use BdPro.Web, :controller

  alias BdPro.Report

  def index(conn, params) do
    report = Report.fetch_vehicle_positions(campaign_id: params["campaign_id"])

    render conn, model: report
  end
end