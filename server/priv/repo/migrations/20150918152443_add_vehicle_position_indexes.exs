defmodule BdPro.Repo.Migrations.AddVehiclePositionIndexes do
  use Ecto.Migration

  def change do
    create index(:vehicle_positions, [:timestamp])
    create index(:vehicles, [:remote_id])
  end
end
