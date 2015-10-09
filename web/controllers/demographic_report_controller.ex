defmodule BdPro.DemographicReportController do
  use BdPro.Web, :controller

  alias BdPro.DemographicReportQuery

  def index(conn, params) do
    render conn, "index.json", demographic_reports: DemographicReportQuery.execute(params)
  end
end
