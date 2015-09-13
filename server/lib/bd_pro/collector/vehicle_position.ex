defmodule BdPro.Collector.VehiclePosition do
  use Timex

  def extract_and_persist(entity) do
    extract(entity) |> persist
  end

  def extract(entity) do
    %BdPro.VehiclePosition{
      lat: entity.vehicle.position.latitude,
      lng: entity.vehicle.position.longitude,
      vehicle_remote_id: entity.id,
      trip_remote_id: entity.vehicle.trip.trip_id,
      timestamp: parse_datetime(entity.vehicle.timestamp)
    }
  end

  def persist(vehicle_position) do
    BdPro.Repo.insert(vehicle_position)
  end

  defp parse_datetime(int) do
    {:ok, timestamp} = DateFormat.parse("#{int}", "{s-epoch}")
    timestamp
  end
end
