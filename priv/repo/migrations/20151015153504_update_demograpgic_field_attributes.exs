defmodule BdPro.Repo.Migrations.UpdateDemograpgicFieldAttributes do
  use Ecto.Migration

  def up do
    execute("ALTER TABLE demographic_fields RENAME COLUMN name TO key")

    alter table(:demographic_fields) do 
      add :name, :string
      add :group, :string
    end
  end

  def down do
    alter table(:demographic_fields) do 
      remove :name
      remove :group
    end

    execute("ALTER TABLE demographic_fields RENAME COLUMN key TO name")
  end
end
