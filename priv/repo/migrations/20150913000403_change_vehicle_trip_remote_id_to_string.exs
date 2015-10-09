defmodule BdPro.Repo.Migrations.ChangeVehicleTripRemoteIdToString do
  use Ecto.Migration

  def up do
    execute("ALTER TABLE vehicle_positions ALTER COLUMN trip_remote_id TYPE varchar")
  end

  def down do
    execute("ALTER TABLE vehicle_positions ALTER COLUMN trip_remote_id TYPE integer USING (trip_remote_id::integer)")
  end
end
