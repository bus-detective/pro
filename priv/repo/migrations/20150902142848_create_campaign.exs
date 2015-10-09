defmodule BdPro.Repo.Migrations.CreateCampaign do
  use Ecto.Migration

  def change do
    create table(:campaigns) do
      add :name, :string

      timestamps
    end

  end
end
