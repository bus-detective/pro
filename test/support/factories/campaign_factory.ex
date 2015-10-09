defmodule BdPro.CampaignFactory do
  alias BdPro.Campaign
  alias BdPro.Repo

  def build(attrs \\ %{}) do
    %Campaign{
      name: attrs[:name] || "Test campaign"
    }
  end

  def create(attrs \\ %{}) do
    Repo.insert! build(attrs)
  end
end
