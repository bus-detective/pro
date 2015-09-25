defmodule BdPro.RepoTest do
  use ExUnit.Case, async: true
  alias BdPro.Repo

  test "hydrate: hydrates a struct with a query result" do
    sql_result = %{
      columns: [
        "population_female", "population_male", "population_18_24", "population_25_44",
        "population_45_64", "population_65_plus", "income_total", "income_median", "population_total"
      ], 
      command: :select, 
      num_rows: 1,
      rows: [[1, 2, 3, 4, 5, 6, 7, 8, 9]]
    }
    [demographic_report] = Repo.hydrate_struct(sql_result, BdPro.DemographicReport)
    assert demographic_report.population_female == 1
    assert demographic_report.population_total == 9
  end
end

