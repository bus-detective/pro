defmodule BdPro.DemographicView do
  use BdPro.Web, :view

  def render("index.json", %{demographics: demographics}) do
    %{
      demographics: render_many(demographics, BdPro.DemographicView, "demographic.json")
    }
  end

  def render("demographic.json", %{demographic: demographic}) do
    %{
      id: demographic.id,
      average_income: demographic.average_income
    }
  end
end
