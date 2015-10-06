defmodule BdPro.DemographicReport do
  defstruct [
    :id,
    :population_total,
    :population_male,
    :population_female,
    :population_18_24,
    :population_25_44,
    :population_45_64,
    :population_65_plus,
    :income_median,
    :income_total
  ]
end
