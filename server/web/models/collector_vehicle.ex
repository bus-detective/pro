defmodule BdPro.CollectorVehicle do
  use BdPro.Web, :model

  schema "vehicles" do
    field :vehicle_id, :string
    field :latitude, :float
    field :longitude, :float
  end
end
