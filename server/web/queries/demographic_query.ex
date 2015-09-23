defmodule BdPro.DemographicQuery do
  alias BdPro.Repo
  use Timex

  @sql """
    SELECT count(tracts.id), tracts.id FROM tracts
      INNER JOIN vehicle_positions ON ST_Intersects(ST_MakePoint(vehicle_positions.lng, vehicle_positions.lat), tracts.shape) = true
      INNER JOIN vehicles ON vehicles.remote_id = vehicle_positions.vehicle_remote_id
      INNER JOIN campaigns ON campaigns.id = vehicles.campaign_id
        WHERE campaigns.id = $1
        AND vehicle_positions.timestamp BETWEEN DATE($2::text) AND DATE($3::text)
      GROUP BY tracts.id
  """

  def search(%{"campaign_id" => campaign_id, "start_date" => start_date, "end_date" => end_date}) do
    Repo.execute(@sql, [String.to_integer(campaign_id), start_date, end_date])
  end
end

