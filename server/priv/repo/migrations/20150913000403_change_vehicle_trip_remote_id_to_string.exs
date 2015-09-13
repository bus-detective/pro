defmodule BdPro.Repo.Migrations.ChangeVehicleTripRemoteIdToString do
  use Ecto.Migration

  def change do
    execute("ALTER TABLE vehicle_positions ALTER COLUMN trip_remote_id TYPE varchar")
  end
end
