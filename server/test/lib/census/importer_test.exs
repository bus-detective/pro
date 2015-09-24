defmodule BdPro.Census.ImporterTest do
  use ExUnit.Case, async: true
  use BdPro.ModelCase
  import BdPro.Factories

  setup do
    tract = create(:tract, tract_remote_id: "770100", state_remote_id: "39", county_remote_id: "001")
    {:ok, tract: tract}
  end

  test "fetches demographics and ties them to a census tract", %{tract: tract} do
    BdPro.Census.Importer.run
    assert Repo.one(from d in BdPro.Demographic, select: count(d.id)) == 1
    assert Repo.one(BdPro.Demographic).tract_id == tract.id
  end
end
