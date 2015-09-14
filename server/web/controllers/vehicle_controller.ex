defmodule BdPro.VehicleController do
  use BdPro.Web, :controller

  alias BdPro.VehicleSearcher

  def index(conn, params) do
    render conn, "index.json", vehicles: VehicleSearcher.search(params)
  end
end
