defmodule BdPro.Collector.VehiclePosition do
  def extract_and_persist(entity) do
    extract(entity) |> persist
  end

  def extract(entity) do
    %BdPro.VehiclePosition{
      lat: entity.vehicle.position.latitude,
      lng: entity.vehicle.position.longitude,
      trip_remote_id: entity.vehicle.trip.trip_id
    }
  end

  def persist(vehicle_position) do
    BdPro.Repo.insert(vehicle_position)
  end
end
