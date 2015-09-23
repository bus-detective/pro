defmodule BdPro.Repo.Migrations.AddProductToVehicle do
  use Ecto.Migration

  def change do
    alter table(:vehicles) do
      add :product, :string
    end
  end
end
