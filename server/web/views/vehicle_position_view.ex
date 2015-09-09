defmodule BdPro.VehiclePositionView do
  use BdPro.Web, :view

  def render("index.json", %{vehicle_postions: vehicle_postions}) do
    %{vehicle_postions: render_many(vehicle_postions, BdPro.VehiclePositionView, "vehicle_position.json")}
  end

  def render("show.json", %{vehicle_postion: vehicle_postion}) do
    %{vehicle_postion: render_one(vehicle_postion, BdPro.VehiclePositionView, "vehicle_position.json")}
  end

  def render("vehicle_position.json", %{vehicle_position: vehicle_position}) do
    %{
      id: vehicle_position.id,
      lat: vehicle_position.lat,
      lng: vehicle_position.lng
    }
  end
end

