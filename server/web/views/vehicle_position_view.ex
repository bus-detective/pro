defmodule BdPro.VehiclePositionView do
  use BdPro.Web, :view

  def render("index.json", %{vehicle_positions: vehicle_positions}) do
    %{
      vehicle_positions: render_many(vehicle_positions, BdPro.VehiclePositionView, "vehicle_position.json")
    }
  end

  def render("vehicle_position.json", %{vehicle_position: vehicle_position}) do
    %{
      id: vehicle_position.id,
      lat: vehicle_position.lat,
      lng: vehicle_position.lng,
      timestamp: Ecto.DateTime.to_iso8601(vehicle_position.timestamp)
    }
  end
end

