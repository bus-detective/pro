defmodule BdPro.Repo.Migrations.InsertDefaultDemographicFields do
  use Ecto.Migration

  @defaults [
    {"population_total", "Tot_Population_ACS_09_13"},
    {"population_male", "Males_ACS_09_13"},
    {"population_female", "Females_ACS_09_13"},
    {"population_18_24", "Pop_18_24_ACS_09_13"},
    {"population_25_44", "Pop_25_44_ACS_09_13"},
    {"population_45_64", "Pop_45_64_ACS_09_13"},
    {"population_65_plus", "Pop_65plus_ACS_09_13"},
    {"income_median", "Med_HHD_Inc_ACS_09_13"},
    {"income_total", "Aggregate_HH_INC_ACS_09_13"}
  ]

  def up do
    @defaults |> Enum.each fn ({name, remote_name}) ->
      BdPro.Repo.insert!(%BdPro.DemographicField{name: name, remote_name: remote_name}) 
    end

    Mix.shell.info("Hey! You need to re-import demographic data. Run `mix bd.census.import`")
  end
end
