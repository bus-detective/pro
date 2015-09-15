defmodule BdPro.Collector.VehiclePosition do
  use Timex

  def extract(entity) do
    %BdPro.VehiclePosition{
      lat: entity.vehicle.position.latitude,
      lng: entity.vehicle.position.longitude,
      vehicle_remote_id: entity.id,
      trip_remote_id: entity.vehicle.trip.trip_id,
      timestamp: Date.from(entity.vehicle.timestamp, :secs, :epoch)
    }
  end

  def set_agency(agency, vehicle_position) do
    Map.put(vehicle_position, :agency_id, agency.id)
  end
end
