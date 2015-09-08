defmodule BdPro.Report do

  alias BdPro.Repo
  alias BdPro.Campaign
  alias BdPro.Vehicle
  alias BdPro.VehiclePosition

  def fetch_vehicle_positions(params) do
   query  = from vehicle_position in VehiclePosition,
     join: vehicle in Vehicle, on: vehicle.id == vehicle_position.vehicle_id,
     where: vehicle.campaign_id == params["campaign_id"]

   Repo.all(query)
  end
end