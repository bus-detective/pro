defmodule BdPro.Repo.Migrations.AddTimestampAndRemoteIdToVehiclePositions do
  use Ecto.Migration

  def up do
    alter table(:vehicles) do
      modify :remote_id, :string
    end

    alter table(:vehicle_positions) do
      add :timestamp, :datetime
      add :vehicle_remote_id, :string
    end

    create index(:vehicle_positions, [:vehicle_remote_id])
  end

  def down do
    execute("ALTER TABLE vehicles ALTER COLUMN remote_id TYPE integer USING (remote_id::integer)")    
    drop index(:vehicle_positions, [:vehicle_remote_id])

    alter table(:vehicle_positions) do
      remove :timestamp
      remove :vehicle_remote_id
    end
  end
end
