defmodule BdPro.Collector do
  @url "http://developer.go-metro.com/TMGTFSRealTimeWebService/vehicle/VehiclePositions.pb" 

  alias BdPro.Collector.Protobuf
  alias BdPro.Collector.Backend
  alias BdPro.Collector.VehiclePosition

  def collect do
    Backend.fetch(@url)
    |> Protobuf.decode
    |> Enum.each(&VehiclePosition.extract_and_persist/1)
  end
end
