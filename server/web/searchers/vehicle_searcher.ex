defmodule BdPro.VehicleSearcher do
  use Timex
  import Ecto.Query, only: [from: 1, from: 2]
  alias BdPro.Repo
  alias BdPro.Vehicle
  alias BdPro.VehiclePosition

  def search(params) do
    vehicle_query = from vehicle in Vehicle

    if params["ids"] do
      vehicle_query = from vehicle in vehicle_query,
        where: vehicle.id in ^params["ids"]
    end

    if params["start_date"] do
      {:ok, start_date} = DateFormat.parse(params["start_date"], "{YYYY}-{0M}-{0D}")
      vehicle_query = from v in vehicle_query,
        join: vp in assoc(v, :vehicle_positions)
    end

    Repo.all(from v in vehicle_query, preload: [:vehicle_positions])
  end
end
