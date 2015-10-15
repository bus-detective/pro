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
  {"population_total", "Tot_Population_ACS_09_13", "Total Population","population", "#5bc0de"},
  {"population_male", "Males_ACS_09_13", "Male", "gender", "#5bc0de"},
  {"population_female", "Females_ACS_09_13", "Female", "gender", "#E2C953"},
  {"population_18_24", "Pop_18_24_ACS_09_13", "18 to 24", "age", "#5bc0de"},
  {"population_25_44", "Pop_25_44_ACS_09_13", "25 to 44", "age", "#E2C953"},
  {"population_45_64", "Pop_45_64_ACS_09_13", "45 to 64", "age", "#d9534f"},
  {"population_65_plus", "Pop_65plus_ACS_09_13", "65 plus", "age", "#005F9B"},
  {"population_not_married", "Not_MrdCple_HHD_ACS_09_13", "Single", "marrital_status", "#E2C953"},
  {"population_married", "MrdCple_Fmly_HHD_ACS_09_13", "Married", "marrital_status", "#d9534f"},
  {"income_median", "Med_HHD_Inc_ACS_09_13", "Median Income", "income", "#d9534f"},
  {"income_total", "Aggregate_HH_INC_ACS_09_13", "Total Income", "income", "#E2C953"},
  {"percentage_hispanic", "pct_Hispanic_ACS_09_13", "Hispanic", "ethnicity", "#5bc0de"},
  {"percentage_asian", "pct_NH_Asian_alone_ACS_09_13", "Asian", "ethnicity", "#E2C953"},
  {"percentage_african_american", "pct_NH_Blk_alone_ACS_09_13", "African American", "ethnicity", "#d9534f"},
  {"percentage_caucasian", "pct_NH_White_alone_ACS_09_13", "Caucasian", "ethnicity", "#005F9B"},
  {"percentage_american_indian", "pct_NH_AIAN_alone_ACS_09_13", "American Indian", "ethnicity", "#E2C953"},
  {"percentage_hawiian", "pct_NH_NHOPI_alone_ACS_09_13", "Hawiian", "ethnicity", "#5bc0de"},
  {"percentage_other", "pct_NH_SOR_alone_ACS_09_13", "Other", "ethnicity", "#E2C953"},
  {"percentage_home_owners", "pct_Owner_Occp_HU_ACS_09_13", "Home Owners", "housing", "#d9534f"},
  {"percentage_renters", "pct_Renter_Occp_HU_ACS_09_13", "Renters", "housing", "#E2C953"},
]

default_demograpgic_fields |> Enum.each fn ({key, remote_name, name, group, color}) ->
  BdPro.Repo.insert!(%BdPro.DemographicField{key: key, name: name, remote_name: remote_name, group: group, color: color})
end


