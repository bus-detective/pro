defmodule BdPro.Census.Connection do
  use HTTPoison.Base
  @endpoint "http://api.census.gov/data/2015/pdb/tract"

  def fetch_tracts(options) do
    uri = URI.parse(@endpoint)
    get!(%{ uri | query: build_query(options) }).body
  end

  def build_query([state_id: state_id, get: columns]) do
    URI.encode_query(%{ for: "tract:*", in: "in=state:#{state_id}", get: Enum.join(columns, ",")})
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> extract_payload
  end

  def extract_payload([keys | tail]) do
    Enum.map tail, fn (item) ->
      Enum.zip(keys, item) |> Enum.into(%{})
    end
  end
end
