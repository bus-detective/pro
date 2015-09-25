defmodule BdPro.DemographicReportQuery do
  alias BdPro.Repo

  @sql """
    SELECT
      CONCAT($1::integer, ':', $2::text, ':', $3::text) aS id, 
      ROUND(AVG(d.population_female)) AS population_female,
      ROUND(AVG(d.population_male)) AS population_male, 
      ROUND(AVG(d.population_18_24)) AS population_18_24,
      ROUND(AVG(d.population_25_44)) AS population_25_44,
      ROUND(AVG(d.population_45_64)) AS population_45_64,
      ROUND(AVG(d.population_65_plus)) AS population_65_plus,
      ROUND(AVG(d.income_total)) AS income_total, 
      ROUND(AVG(d.income_median)) as income_median 
      FROM demographics as d
        INNER JOIN tracts ON tracts.id = d.tract_id
        INNER JOIN vehicle_positions ON ST_INTERSECTS(ST_MAKEPOINT(vehicle_positions.lng, vehicle_positions.lat), tracts.shape) = true
        INNER JOIN vehicles ON vehicles.remote_id = vehicle_positions.vehicle_remote_id
        INNER JOIN campaigns ON campaigns.id = vehicles.campaign_id
          WHERE campaigns.id = $1
          AND vehicle_positions.timestamp BETWEEN DATE($2::text) AND DATE($3::text)
  """

  def execute(%{"campaign_id" => campaign_id, "start_date" => start_date, "end_date" => end_date}) do
    @sql
    |> Repo.execute([String.to_integer(campaign_id), start_date, end_date])
    |> Repo.hydrate_struct(BdPro.DemographicReport)
  end
end

