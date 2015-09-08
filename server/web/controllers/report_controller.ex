defmodule BdPro.ReportController do
  use BdPro.Web, :controller

  alias BdPro.Report

  def index(conn, params) do
    render conn, model: Report.generate(params)
  end
end
