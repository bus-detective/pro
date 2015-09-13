defmodule BdPro.Collector do
  @url "http://developer.go-metro.com/TMGTFSRealTimeWebService/vehicle/VehiclePositions.pb" 

  alias BdPro.Collector.Protobuf
  alias BdPro.Collector.Backend
  alias BdPro.Collector.VehiclePosition
  import IEx

  def collect do
    Backend.fetch(@url)
    |> Protobuf.decode
    |> Enum.map(&VehiclePosition.extract/1)
    |> Enum.each(&persist_vehicle_position/1)
  end

  def persist_vehicle_position(vehicle_position) do
    BdPro.Repo.insert(vehicle_position)
  end
end
