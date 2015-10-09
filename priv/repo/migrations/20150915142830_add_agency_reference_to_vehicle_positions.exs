defmodule BdPro.Repo.Migrations.AddAgencyReferenceToVehiclePositions do
  use Ecto.Migration

  def change do
    alter table(:vehicle_positions) do
      add :agency_id, references(:agencies)
    end
  end
end
