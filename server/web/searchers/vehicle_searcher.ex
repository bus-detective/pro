defmodule BdPro.VehicleSearcher do
  import Ecto.Query, only: [from: 1, from: 2] 
  alias BdPro.Repo
  alias BdPro.Vehicle

  def search(params) do
    query = from vehicle in Vehicle, preload: [:vehicle_positions]

    if params["ids"] do
      query = from vehicle in query,
        where: vehicle.id in ^params["ids"]
    end
    
    Repo.all(query)
  end
end
