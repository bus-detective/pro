defmodule BdPro.ReportView do
  use BdPro.Web, :view
  alias BdPro.CollectorVehicleView

  def render("show.json", %{report: report}) do
    %{
      report: render_one(report, BdPro.ReportView, "report.json"),
      vehicle_positions: render_many(report.vehicle_positions, CollectorVehicleView, "collector_vehicle.json"),
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

