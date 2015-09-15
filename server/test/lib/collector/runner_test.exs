defmodule BdPro.Collector.RunnerTest do
  use ExUnit.Case, async: true
  use BdPro.ModelCase

  setup_all do
    Application.put_env :bd_pro, :collector_backend, BdPro.Collector.Backend.Fake
  end

  setup do
    {:ok, agency} = Repo.insert(%BdPro.Agency{name: "Metro"})
    {:ok, agency: agency}
  end

  test "collect with a specific agency", %{agency: agency} do
    BdPro.Collector.Runner.collect(agency)

    count_query = from v in BdPro.VehiclePosition, 
      where: v.agency_id == ^agency.id,
      select: count(v.id)

    assert Repo.one(count_query) > 0
  end

  test "collect for all agencies", %{agency: agency} do
    BdPro.Collector.Runner.collect

    count_query = from v in BdPro.VehiclePosition, 
      where: v.agency_id == ^agency.id,
      select: count(v.id)

    assert Repo.one(count_query) > 0
  end
end
