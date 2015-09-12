defmodule BdPro.VehiclePositionController do
  use BdPro.Web, :controller

  alias BdPro.VehiclePositionSearcher

  def index(conn, params) do
    render conn, "index.json", vehicle_positions: VehiclePositionSearcher.search(params)
  end
end
