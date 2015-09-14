defmodule BdPro.VehicleSearcher do
  import Ecto.Query, only: [from: 1, from: 2] 
  alias BdPro.Repo
  alias BdPro.Vehicle

  def search(params) do
    query = from vehicle in Vehicle,
      where: vehicle.id in ^params["ids"]
    
    Repo.all(query)
  end
end
