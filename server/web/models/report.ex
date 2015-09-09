defmodule BdPro.Report do
  defstruct id: nil, name: "Test report", vehicle_positions: []

  import Ecto.Query, only: [from: 1, from: 2] 
  alias BdPro.Repo
  alias BdPro.CollectorRepo
  alias BdPro.CollectorVehicle
  alias BdPro.Vehicle

  def generate(params) do
    vehicle_remote_ids_query =  from vehicle in Vehicle,
      where: vehicle.campaign_id == ^params[:campaign_id],
      select: vehicle.remote_id

    remote_ids = Repo.all(vehicle_remote_ids_query)
    
    vehicle_query = from vehicle in CollectorVehicle,
      where: vehicle.vehicle_id in ^Enum.map(remote_ids, &("#{&1}")),
      select: vehicle

    vehicles = CollectorRepo.all(vehicle_query)
     
    %BdPro.Report{
      id: params[:campaign_id],
      vehicle_positions: vehicles 
    }
  end
end
