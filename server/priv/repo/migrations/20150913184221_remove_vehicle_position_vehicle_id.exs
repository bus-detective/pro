defmodule BdPro.Repo.Migrations.RemoveVehiclePositionVehicleId do
  use Ecto.Migration

  def up do
    alter table(:vehicle_positions) do
      remove :vehicle_id
    end
  end

  def down do
    alter table(:vehicle_positions) do
      add :vehicle_id, :integer
    end
  end
end
