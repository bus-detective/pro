defmodule BdPro.Collector.Protobuf do
  use Protobuf, from: Path.expand("./proto/gtfs-realtime.proto", __DIR__)
  alias BdPro.Collector.Protobuf.FeedMessage

  def decode(buffer) do
    FeedMessage.decode(buffer).entity
  end
end
