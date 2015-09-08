defmodule BdPro.VehiclePositionsSerializer do
  use JaSerializer

  attributes [:lat, :lng]
  def type, do: "vehicle-position"
end

defmodule BdPro.ReportView do
  use BdPro.Web, :view
  use JaSerializer.PhoenixView
  attributes [:title]

  has_many :vehicle_positions, include: BdPro.VehiclePositionsSerializer, type: "vehicle_position"
end
