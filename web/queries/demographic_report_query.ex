defmodule BdPro.DemographicReportQuery do
  alias BdPro.Repo

  @sql """
    SELECT
      CONCAT($1::integer, ':', demographic_fields.id) AS id, 
      demographic_fields.name,
      demographic_fields.key,
      demographic_fields.group,
      AVG(demographics.value) AS value
    FROM demographic_fields
    INNER JOIN demographics ON demographics.demographic_field_id = demographic_fields.id
    INNER JOIN tracts ON tracts.id = demographics.tract_id
    INNER JOIN vehicle_positions ON ST_INTERSECTS(ST_MAKEPOINT(vehicle_positions.lng, vehicle_positions.lat), tracts.shape) = true
    INNER JOIN vehicles ON vehicles.remote_id = vehicle_positions.vehicle_remote_id
    INNER JOIN campaigns ON campaigns.id = vehicles.campaign_id
      WHERE campaigns.id = $1
      AND vehicle_positions.timestamp BETWEEN DATE($2::text) AND DATE($3::text)
    GROUP BY demographic_fields.id
  """

  def execute(%{"campaign_id" => campaign_id, "start_date" => start_date, "end_date" => end_date}) do
    @sql
    |> Repo.execute([String.to_integer(campaign_id), start_date, end_date])
    |> Repo.hydrate_struct(BdPro.DemographicReport)
  end
end

