defmodule BdPro.Repo.Migrations.CreateDemographic do
  use Ecto.Migration

  def change do
    create table(:demographics) do
      add :tract_id, references(:tracts)
      add :income_median, :integer
      add :income_total, :integer
      add :population_total, :integer
      add :population_male, :integer
      add :population_female, :integer
      add :population_18_24, :integer
      add :population_25_44, :integer
      add :population_45_64, :integer
      add :population_65_plus, :integer

      timestamps
    end

  end
end
