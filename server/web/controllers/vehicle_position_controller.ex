defmodule BdPro.VehiclePositionController do
  use BdPro.Web, :controller

  alias BdPro.VehiclePositionSearcher

  def index(conn, params) do
    IO.inspect VehiclePositionSearcher.search(params)
    render conn, "index.json", vehicle_positions: VehiclePositionSearcher.search(params)
  end

  def show(conn, params) do
    render conn, "show.json", vehicle_positions: VehiclePositionSearcher.search(params)
  end
end
