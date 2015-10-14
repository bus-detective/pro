defmodule BdPro.Census.Importer do
  alias BdPro.Census.Connection
  alias BdPro.Repo
  alias BdPro.DemographicField
  alias BdPro.Tract

  def run do
    fields = Repo.all(DemographicField.Query.all)
    Enum.each(fields, &fetch_and_create_demographics/1)
  end

  def fetch_and_create_demographics(field) do
    Connection.fetch_tracts(state_id: 39, get: [field.remote_name])
    |> Enum.each(fn (census_demographic) -> create_demographic(census_demographic, field) end)
  end

  def create_demographic(census_demographic, field) do
    build_changeset(census_demographic, field) |> BdPro.Repo.insert
  end

  def build_changeset(census_demographic, field) do
    BdPro.Demographic.changeset(%BdPro.Demographic{}, %{
      value: extract_value(census_demographic, field),
      tract_id: tract_id_for_census_demographic(census_demographic),
      demographic_field_id: field.id
    })
  end

  def tract_id_for_census_demographic(%{"state" => state, "county" => county, "tract" => tract}) do
    case Repo.get_by(Tract, state_remote_id: state, county_remote_id: county, tract_remote_id: tract) do
      nil -> nil
      tract -> tract.id
    end
  end

  def tract_id_for_census_demographic(_) do
    nil
  end

  def extract_value(census_demographic, field) do
    census_demographic[field.remote_name] |> coerce_value
  end

  def coerce_value(nil), do: nil

  def coerce_value(value) do
    value
    |> String.replace(~r/[$,]/, "")
    |> String.to_integer
  end
end
