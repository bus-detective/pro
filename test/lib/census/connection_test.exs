defmodule BdPro.Census.ConnectionTest do
  use ExUnit.Case, async: true

  test "fetch_tract: fetches information for the tract" do
    result = BdPro.Census.Connection.fetch_tracts(state_id: 39, get: ["Tot_Population_ACS_09_13"])
    assert hd(result)["Tot_Population_ACS_09_13"] == "5087"
  end
end
