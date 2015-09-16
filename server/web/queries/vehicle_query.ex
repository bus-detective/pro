defmodule BdPro.VehicleQuery do
  use Timex
  import Ecto.Query, only: [from: 1, from: 2]
  alias BdPro.Vehicle

  def search(params) do
    vehicle_query = from v in Vehicle, 
      where: v.id in ^(params["ids"] || [])

    if params["start_date"] && params["end_date"] do 
      vehicle_query = from v in vehicle_query,
        join: vp in assoc(v, :vehicle_positions),
        where: vp.timestamp > ^parse_date(params["start_date"]) and vp.timestamp < ^parse_date(params["end_date"]),
        preload: [vehicle_positions: vp]
    end

    vehicle_query
  end

  defp parse_date(date_string) do
    {:ok, date} = Ecto.DateTime.cast("#{date_string} 00:00:00")
    date
  end
end

