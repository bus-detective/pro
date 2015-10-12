defmodule BdPro.Repo.Migrations.AddDemographicFields do
  use Ecto.Migration

  def up do
    create table(:demographic_fields) do
      add :name, :string
      add :remote_name, :string

      timestamps
    end

    alter table(:demographics) do
      add :demographic_field_id, references(:demographic_fields)
      add :value, :integer

      remove :population_total
      remove :population_male
      remove :population_female
      remove :population_18_24
      remove :population_25_44
      remove :population_45_64
      remove :population_65_plus
      remove :income_median
      remove :income_total
    end
  end

  def down do
    alter table(:demographics) do
      remove :demographic_field_id
      remove :value

      add :income_median, :integer
      add :income_total, :integer
      add :population_total, :integer
      add :population_male, :integer
      add :population_female, :integer
      add :population_18_24, :integer
      add :population_25_44, :integer
      add :population_45_64, :integer
      add :population_65_plus, :integer
    end
    drop table(:demographic_fields)
  end
end
