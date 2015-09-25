defmodule BdPro.Repo.Migrations.AddGistIndexToTracts do
  use Ecto.Migration

  def up do
    create index(:tracts, [:shape], using: "GIST")
  end

  def down do
    drop index(:tracts, [:shape])
  end
end
