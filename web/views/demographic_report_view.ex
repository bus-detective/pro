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
      population_total: demographic_report.population_total,
      population_male: demographic_report.population_male,
      population_female: demographic_report.population_female,
      population_18_24: demographic_report.population_18_24,
      population_25_44: demographic_report.population_25_44,
      population_45_64: demographic_report.population_45_64,
      population_65_plus: demographic_report.population_65_plus,
      income_median: demographic_report.income_median,
      income_total: demographic_report.income_total,
    }
  end
end
