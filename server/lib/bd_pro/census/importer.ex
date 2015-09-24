defmodule BdPro.Census.Importer do
  import Ecto.Query, only: [from: 2]

  @fields %{
    population_total: "Tot_Population_ACS_09_13",
    population_male: "Males_ACS_09_13",
    population_female: "Females_ACS_09_13",
    population_18_24: "Pop_18_24_ACS_09_13",
    population_25_44: "Pop_25_44_ACS_09_13",
    population_45_64: "Pop_45_64_ACS_09_13",
    population_65_plus: "Pop_65plus_ACS_09_13",
    income_median: "Med_HHD_Inc_ACS_09_13",
    income_total: "Aggregate_HH_INC_ACS_09_13"
  }

  def run do
    BdPro.Census.fetch_tracts(state_id: 39, get: Dict.values(@fields))
    |> Enum.map(&create_demographic/1)
  end

  def create_demographic(result) do
    tract = lookup_tract(result)
    result
    |> build_changeset
    |> assign_tract(tract)
    |> persist
  end

  def lookup_tract(%{"state" => state, "county" => county, "tract" => tract}) do
    query = from t in BdPro.Tract,
      where: t.state_remote_id == ^state and
        t.county_remote_id == ^county and
        t.tract_remote_id == ^tract
    BdPro.Repo.one(query)
  end

  def build_changeset(result) do
    attributes = @fields
    |> Enum.map(fn ({k, v}) -> { k, Dict.get(result, v) } end)
    |> Enum.into(%{})
    BdPro.Demographic.changeset(%BdPro.Demographic{}, attributes)
  end

  def assign_tract(changeset, nil) do
    changeset
  end

  def assign_tract(changeset, tract) do
    BdPro.Demographic.changeset(changeset, %{tract_id: tract.id})
  end

  def persist(changeset) do
    if Ecto.Changeset.get_change(changeset, :tract_id) do
      BdPro.Repo.insert!(changeset)
    end
  end
end
