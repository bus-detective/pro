defmodule BdPro.Repo.Migrations.CreateVehiclePosition do
  use Ecto.Migration

  def change do
    create table(:vehicle_positions) do
      add :trip_remote_id, :integer
      add :lat, :float
      add :lng, :float
      add :vehicle_id, references(:vehicles)

      timestamps
    end
    create index(:vehicle_positions, [:vehicle_id])

  end
end
