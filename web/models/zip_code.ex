defmodule BdPro.ZipCode do
  use BdPro.Web, :model
  import Geo.PostGIS

  schema "zip_codes" do
    field :zip_code, :string
    field :shape, Geo.MultiPolygon
    timestamps
  end

  defmodule Query do
    def where(%{"campaign_id" => campaign_id, "start_date" => start_date, "end_date" => end_date}) do
      from zip_code in BdPro.ZipCode,
        join: vp in BdPro.VehiclePosition, on: st_intersects(zip_code.shape, fragment("ST_MAKEPOINT(?, ?)", vp.lng, vp.lat)),
        join: v in BdPro.Vehicle, on: v.remote_id == vp.vehicle_remote_id,
        join: c in BdPro.Campaign, on: c.id == ^campaign_id,
          where: c.id == ^campaign_id and fragment("? BETWEEN DATE(?::text) AND DATE(?::text)", vp.timestamp, ^start_date, ^end_date),
        select: [zip_code, count(zip_code.id)],
        group_by: zip_code.id
    end
  end
end
