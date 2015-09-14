defmodule BdPro.VehicleView do
  use BdPro.Web, :view

  def render("index.json", %{vehicles: vehicles}) do
    %{ vehicles: render_many(vehicles, BdPro.VehicleView, "vehicle_with_positions.json") }
  end

  def render("show.json", %{vehicle: vehicle}) do
    %{ vehicle: render_one(vehicle, BdPro.VehicleView, "vehicle.json") }
  end

  def render("vehicle.json", %{vehicle: vehicle}) do
    %{
      id: vehicle.id,
      remote_id: vehicle.remote_id
    }
  end

  def render("vehicle_with_positions.json", %{vehicle: vehicle}) do
    %{
      id: vehicle.id,
      remote_id: vehicle.remote_id,
      vehicle_positions: render_many(vehicle.vehicle_positions, BdPro.VehiclePositionView, "vehicle_position.json")
    }
  end
end

