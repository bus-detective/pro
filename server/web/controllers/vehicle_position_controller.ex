defmodule BdPro.VehiclePositionController do
  use BdPro.Web, :controller

  alias BdPro.VehiclePositionQuery

  def index(conn, params) do
    render conn, "index.json", vehicle_positions: Repo.all(VehiclePositionQuery.search(params))
  end
end
