defmodule BdPro.Repo.Migrations.AddShapeIndexOnZipCodes do
  use Ecto.Migration

  def up do
    create index(:zip_codes, [:shape], using: "GIST")
  end

  def down do
    drop index(:zip_codes, [:shape])
  end
end
