defmodule BdPro.Repo.Migrations.CreateTract do
  use Ecto.Migration

  def change do
    create table(:tracts) do
      add :state, :string
      add :county, :string
      add :shape, :geometry

      timestamps
    end

  end
end
