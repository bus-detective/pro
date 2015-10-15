defmodule BdPro.DemographicReportView do
  use BdPro.Web, :view

  def render("index.json", %{demographic_reports: demographic_reports}) do
    %{
      demographic_reports: render_many(demographic_reports, BdPro.DemographicReportView, "demographic.json")
    }
  end

  def render("demographic.json", %{demographic_report: demographic_report}) do
    %{
      id: demographic_report.id,
      name: demographic_report.name,
      value: demographic_report.value
    }
  end
end
