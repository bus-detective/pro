defmodule BdPro.Collector.Runner do
  alias BdPro.Collector.Protobuf
  alias BdPro.Collector.Backend
  alias BdPro.Collector.VehiclePosition
  alias BdPro.Repo

  import Ecto.Query, only: [from: 1, from: 2] 

  def collect do
    agencies |> Enum.each(&collect/1)
  end

  def collect(agency) do
    agency.feed_url
    |> Backend.fetch
    |> Protobuf.decode
    |> Stream.map(&VehiclePosition.extract_changeset/1)
    |> Stream.map(&VehiclePosition.set_agency(agency, &1))
    |> Stream.map(&Repo.insert!/1)
    |> Enum.to_list
  end

  defp agencies do
    BdPro.Repo.all(BdPro.Agency)
  end
end
