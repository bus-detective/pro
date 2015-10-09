defmodule BdPro.Repo.Migrations.AddProductToCampaigns do
  use Ecto.Migration

  def change do
    alter table(:campaigns) do
      add :product, :string
    end
  end
end
