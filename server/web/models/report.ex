defmodule BdPro.Report do
  defstruct id: nil, title: "Test report", vehicle_positions: []

  import Ecto.Query, only: [from: 1, from: 2] 
  alias BdPro.Repo
  alias BdPro.Vehicle
  alias BdPro.VehiclePosition

  def generate(params) do
    vehicle_positions_query = from vehicle_position in VehiclePosition,
      join: vehicle in Vehicle, on: vehicle.id == vehicle_position.vehicle_id,
      where: vehicle.campaign_id == ^params[:campaign_id]
   
    %BdPro.Report{
      id: params[:campaign_id],
      vehicle_positions: Repo.all(vehicle_positions_query)
    }
  end
end
