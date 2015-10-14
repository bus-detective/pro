defmodule BdPro.Census.ImporterTest do
  use ExUnit.Case, async: true
  use BdPro.ModelCase
  import BdPro.Factories
  alias BdPro.Census.Importer

  setup do
    {:ok, demographic_field: create(:demographic_field, name: "population_total", remote_name: "Tot_Population_ACS_09_13") }
  end

  setup do
    {:ok, tract: create(:tract, tract_remote_id: "770100", state_remote_id: "39", county_remote_id: "001") }
  end

  test "run: fetches demographics and ties them to a census tract", %{tract: %{id: tract_id}, demographic_field: %{id: demographic_field_id}} do
    Importer.run
    assert Repo.one(from d in BdPro.Demographic, select: count(d.id)) == 1
    assert %{demographic_field_id: demographic_field_id, tract_id: tract_id, value: 5087.0} = Repo.one(BdPro.Demographic)
  end

  test "coerce_value: converts strings like `$1,123,1234` to floats" do
    assert Importer.coerce_value("$1,234,567") == 1_234_567.0
  end
end
