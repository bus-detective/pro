defmodule BdPro.Repo.Migrations.CreateVehicle do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :remote_id, :integer
      add :campaign_id, references(:campaigns)

      timestamps
    end
    create index(:vehicles, [:campaign_id])
  end
end
