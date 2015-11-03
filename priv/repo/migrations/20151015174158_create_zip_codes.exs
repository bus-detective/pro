defmodule BdPro.Repo.Migrations.CreateZipCodes do
  use Ecto.Migration

  def change do
    create table(:zip_codes) do
      add :state_remote_id, :string
      add :zip_code, :string
      add :geo_remote_id, :string
      add :fips_remote_id, :string
      add :mtfcc, :string
      add :funcstat, :string
      add :land, :string
      add :water, :string
      add :lat, :string
      add :lng, :string
      add :part_flg, :string
      add :shape, :geometry

      timestamps
    end
  end
end
