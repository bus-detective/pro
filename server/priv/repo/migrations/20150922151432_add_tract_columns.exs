defmodule BdPro.Repo.Migrations.AddTractColumns do
  use Ecto.Migration

  def change do
    alter table(:tracts) do
      remove :state
      remove :county
      add :state_remote_id, :string
      add :county_remote_id, :string
      add :tract_remote_id, :string
      add :geo_remote_id, :string
      add :name, :string
      add :description, :string
      add :mtfcc, :string
      add :funcstat, :string
      add :land, :string
      add :water, :string
      add :lat, :string
      add :lng, :string
    end
  end
end
