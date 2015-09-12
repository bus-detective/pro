defmodule BdPro.VehiclePositionSearcher do
  import Ecto.Query, only: [from: 1, from: 2] 
  alias BdPro.Repo
  alias BdPro.CollectorRepo
  alias BdPro.CollectorVehicle
  alias BdPro.Vehicle

  def search(params) do
    vehicle_remote_ids_query =  from vehicle in Vehicle,
      where: vehicle.id in ^params["vehicle_ids"],
      select: vehicle.remote_id

    remote_ids = Repo.all(vehicle_remote_ids_query)
    
    vehicle_query = from vehicle in CollectorVehicle,
      where: vehicle.vehicle_id in ^remote_ids,
      select: vehicle

    CollectorRepo.all(vehicle_query) |> Enum.map fn (collector_vehicle) ->
      %BdPro.VehiclePosition{
        id: collector_vehicle.id,
        lat: collector_vehicle.latitude,
        lng: collector_vehicle.longitude
      }
    end
  end
end
