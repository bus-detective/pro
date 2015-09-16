defmodule BdPro.VehicleController do
  use BdPro.Web, :controller

  alias BdPro.VehicleQuery

  def index(conn, params) do
    render conn, "index.json", vehicles: Repo.all(VehicleQuery.search(params))
  end
end
