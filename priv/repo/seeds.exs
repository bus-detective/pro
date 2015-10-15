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
  {"population_total", "Tot_Population_ACS_09_13", "Total Population","population"},
  {"population_male", "Males_ACS_09_13", "Male", "gender"},
  {"population_female", "Females_ACS_09_13", "Female", "gender"},
  {"population_18_24", "Pop_18_24_ACS_09_13", "18 to 24", "age"},
  {"population_25_44", "Pop_25_44_ACS_09_13", "25 to 44", "age"},
  {"population_45_64", "Pop_45_64_ACS_09_13", "45 to 64", "age"},
  {"population_65_plus", "Pop_65plus_ACS_09_13", "65 plus", "age"},
  {"population_not_married", "Not_MrdCple_HHD_ACS_09_13", "Single", "marrital_status"},
  {"population_married", "MrdCple_Fmly_HHD_ACS_09_13". "Married", "marrital_status"},
  {"income_median", "Med_HHD_Inc_ACS_09_13", "Median Income", "income"},
  {"income_total", "Aggregate_HH_INC_ACS_09_13", "Total Income", "income"},
  {"percentage_hispanic", "pct_Hispanic_ACS_09_13", "Hispanic", "ethnicity"},
  {"percentage_asian", "pct_NH_Asian_alone_ACS_09_13", "Asian", "ethnicity"},
  {"percentage_african_american", "pct_NH_Blk_alone_ACS_09_13", "African American", "ethnicity"},
  {"percentage_caucasian", "pct_NH_White_alone_ACS_09_13", "Caucasian", "ethnicity"},
  {"percentage_american_indian", "pct_NH_AIAN_alone_ACS_09_13", "American Indian", "ethnicity"},
  {"percentage_hawiian", "pct_NH_NHOPI_alone_ACS_09_13", "Hawiian", "ethnicity"},
  {"percentage_other", "pct_NH_SOR_alone_ACS_09_13", "Other", "ethnicity"},
  {"percentage_home_owners", "pct_Owner_Occp_HU_ACS_09_13", "Home Owners", "housing"},
  {"percentage_renters", "pct_Renter_Occp_HU_ACS_09_13", "Renters", "housing"},
]

default_demograpgic_fields |> Enum.each fn ({key, remote_name, name, group}) ->
  BdPro.Repo.insert!(%BdPro.DemographicField{name: name, remote_name: remote_name})
end
