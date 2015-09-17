defmodule BdPro.VehiclePositionQueryTest do
  use BdPro.QueryCase
  alias BdPro.VehiclePositionQuery

  test "search: scope by campaign_id" do
    query = VehiclePositionQuery.search(%{"campaign_id" => "1234"})
    assert sql_params(query) == [1234]
  end

  test "search: scope by start_date and end_date" do
    query = VehiclePositionQuery.search(%{"campaign_id" => "1234", "start_date" => "2015-02-02", "end_date" => "2015-02-02"})
    assert sql_params(query) == [1234, {{2015, 2, 2}, {0, 0, 0, 0}}, {{2015, 2, 2}, {0, 0, 0, 0}}]
  end
end

