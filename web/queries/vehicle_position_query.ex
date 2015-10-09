defmodule BdPro.VehiclePositionQuery do
  import Ecto.Query, only: [from: 1, from: 2]
  alias BdPro.VehiclePosition

  def search(params) do
    query = from vp in VehiclePosition, 
      join: v in assoc(vp, :vehicle),
      join: c in assoc(v, :campaign),
      where: c.id == ^params["campaign_id"]

    if params["start_date"] && params["end_date"] do 
      query = from vp in query,
        where: vp.timestamp > ^parse_date(params["start_date"]) and vp.timestamp < ^parse_date(params["end_date"])
    end

    query
  end

  defp parse_date(date_string) do
    {:ok, date} = Ecto.DateTime.cast("#{date_string} 00:00:00")
    date
  end
end

