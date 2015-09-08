defmodule BdPro.ReportController do
  use BdPro.Web, :controller

  alias BdPro.Campaign
  alias BdPro.Vehicle
  alias BdPro.VehiclePosition

  def index(conn, params) do
    campaign = Repo.get!(Campaign, params["campaign_id"])
    |> Repo.preload([:vehicles])

    render conn, model: campaign, vehicles: campaign.vehicles
  end
end