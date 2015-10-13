defmodule BdPro.VehiclePositionFactory do
  alias BdPro.VehiclePosition
  alias BdPro.Vehicle
  alias BdPro.Repo

  def build(attrs \\ %{}) do
    %VehiclePosition{
      trip_remote_id: attrs[:remote_id] || "1234",
      lat: "39.2373",
      lng: "-84.54771",
      vehicle_remote_id: attrs[:vehicle_remote_id] || "2106"
    }
  end

  def create(attrs \\ %{}) do
    Repo.insert! build(attrs)
  end
end
