defmodule BdPro.CollectorVehicleView do
  use BdPro.Web, :view

  def render("collector_vehicle.json", %{collector_vehicle: collector_vehicle}) do
    %{
      id: collector_vehicle.id,
      lat: collector_vehicle.latitude,
      lng: collector_vehicle.longitude
    }
  end
end


