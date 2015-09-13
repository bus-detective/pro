defmodule BdPro.CollectorTest do
  use ExUnit.Case, async: true
  use BdPro.ModelCase

  setup do
    Application.put_env :bd_pro, :collector_backend, BdPro.Collector.Backend.Fake
    :ok
  end

  test "collect" do
    BdPro.Collector.collect
    vehicle_position_count = BdPro.Repo.one(from v in BdPro.VehiclePosition, select: count(v.id))
    assert vehicle_position_count > 0
  end
end
