defmodule BdPro.VehicleFactory do
  alias BdPro.Campaign
  alias BdPro.Vehicle
  alias BdPro.Repo

  def build(attrs \\ %{}) do
    %Vehicle{
      remote_id: attrs[:remote_id] || "1234",
      campaign_id: attrs[:campaign_id],
      product: attrs[:product] || "Kong Wrap"
    }
  end

  def create(attrs \\ %{}) do
    Repo.insert! build(attrs)
  end
end
