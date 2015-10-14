# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BdPro.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

default_demograpgic_fields = [
  {"population_total", "Tot_Population_ACS_09_13"},
  {"population_male", "Males_ACS_09_13"},
  {"population_female", "Females_ACS_09_13"},
  {"population_18_24", "Pop_18_24_ACS_09_13"},
  {"population_25_44", "Pop_25_44_ACS_09_13"},
  {"population_45_64", "Pop_45_64_ACS_09_13"},
  {"population_65_plus", "Pop_65plus_ACS_09_13"},
  {"population_not_married", "Not_MrdCple_HHD_ACS_09_13"},
  {"population_married", "MrdCple_Fmly_HHD_ACS_09_13"},
  {"income_median", "Med_HHD_Inc_ACS_09_13"},
  {"income_total", "Aggregate_HH_INC_ACS_09_13"},
  {"percentage_hispanic", "pct_Hispanic_ACS_09_13"},
  {"percentage_asian", "pct_NH_Asian_alone_ACS_09_13"},
  {"percentage_african_american", "pct_NH_Blk_alone_ACS_09_13"},
  {"percentage_caucasian", "pct_NH_White_alone_ACS_09_13"},
  {"percentage_american_indian", "pct_NH_AIAN_alone_ACS_09_13"},
  {"percentage_hawiian", "pct_NH_NHOPI_alone_ACS_09_13"},
  {"percentage_other", "pct_NH_SOR_alone_ACS_09_13"},
  {"percentage_home_owners", "pct_Owner_Occp_HU_ACS_09_13"},
  {"percentage_renters", "pct_Renter_Occp_HU_ACS_09_13"},
]

default_demograpgic_fields |> Enum.each fn ({name, remote_name}) ->
  BdPro.Repo.insert!(%BdPro.DemographicField{name: name, remote_name: remote_name})
end
