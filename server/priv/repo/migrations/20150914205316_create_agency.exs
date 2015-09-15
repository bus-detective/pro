defmodule BdPro.Repo.Migrations.CreateAgency do
  use Ecto.Migration

  def change do
    create table(:agencies) do
      add :name, :string
      add :feed_url, :string

      timestamps
    end
  end
end
