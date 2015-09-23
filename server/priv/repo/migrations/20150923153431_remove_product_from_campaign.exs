defmodule BdPro.Repo.Migrations.RemoveProductFromCampaign do
  use Ecto.Migration

  def change do
    alter table(:campaigns) do
      remove :product
    end
  end
end
