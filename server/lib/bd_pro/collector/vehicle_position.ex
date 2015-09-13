defmodule BdPro.Collector.VehiclePosition do
  def extract(entity) do
    %BdPro.VehiclePosition{
      lat: entity.vehicle.position.latitude,
      lng: entity.vehicle.position.longitude,
      trip_remote_id: entity.vehicle.trip.trip_id
    }
  end
end
