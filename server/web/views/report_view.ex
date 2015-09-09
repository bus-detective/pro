defmodule BdPro.ReportView do
  use BdPro.Web, :view

  def render("index.json", %{reports: reports}) do
    %{reports: render_many(reports, BdPro.ReportView, "report.json")}
  end

  def render("show.json", %{report: report}) do
    %{
      report: render_one(report, BdPro.ReportView, "report.json"),
      vehicle_positions: render_many(report.vehicle_positions, BdPro.VehiclePositionView, "vehicle_position.json"),
    }
  end

  def render("report.json", %{report: report}) do
    %{
      id: report.id,
      name: report.name,
      vehicle_position_ids: Enum.map(report.vehicle_positions, &(&1.id))
    }
  end
end

