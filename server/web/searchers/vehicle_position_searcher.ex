defmodule BdPro.VehiclePositionSearcher do
  import Ecto.Query, only: [from: 1, from: 2] 
  alias BdPro.Repo
  alias BdPro.CollectorRepo
  alias BdPro.CollectorVehicle
  alias BdPro.Vehicle
  alias BdPro.VehiclePosition

  def search(params) do
    vehicle_remote_ids_query =  from vehicle in Vehicle,
      where: vehicle.id in ^Enum.map(params["vehicle_id"], &("#{&1}")),
      select: vehicle.remote_id

    remote_ids = Repo.all(vehicle_remote_ids_query)

    vehicle_query = from vehicle in CollectorVehicle,
      where: vehicle.vehicle_id in ^Enum.map(remote_ids, &("#{&1}")),
      select: %{ vehicle_id: vehicle.vehicle_id, lat: vehicle.latitude, lng: vehicle.longitude }

    CollectorRepo.all(vehicle_query)
  end
end
