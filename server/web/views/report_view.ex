defmodule BdPro.ReportView do
  use BdPro.Web, :view

  def render("index.json", %{reports: reports}) do
    %{reports: render_many(reports, BdPro.ReportView, "report.json")}
  end

  def render("show.json", %{report: report}) do
    %{report: render_one(report, BdPro.ReportView, "report.json")}
  end

  def render("report.json", %{report: report}) do
    IO.inspect(report.vehicle_positions)
    %{
      id: report.id,
      name: report.name,
      vehicle_positions: render_many(report.vehicle_positions, BdPro.VehiclePositionView, "vehicle_position.json") 
    }
  end
end

