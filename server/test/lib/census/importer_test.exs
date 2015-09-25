defmodule BdPro.Census.ImporterTest do
  use ExUnit.Case, async: true
  use BdPro.ModelCase
  import BdPro.Factories
  alias BdPro.Census.Importer

  test "run: fetches demographics and ties them to a census tract" do
    tract = create(:tract, tract_remote_id: "770100", state_remote_id: "39", county_remote_id: "001")
    Importer.run
    assert Repo.one(from d in BdPro.Demographic, select: count(d.id)) == 1
    assert Repo.one(BdPro.Demographic).tract_id == tract.id
  end

  test "coerce_value: converts strings like `$1,123,1234` to integers" do
    assert Importer.coerce_value("$1,234,567") == 1_234_567
  end
end
