defmodule BdPro.CampaignController do
  use BdPro.Web, :controller

  alias BdPro.Campaign

  plug :scrub_params, "campaign" when action in [:create, :update]

  def index(conn, _params) do
    campaigns = Repo.all(Campaign)
    render(conn, "index.json", campaigns: campaigns)
  end

  def show(conn, %{"id" => id}) do
    campaign = Repo.get!(Campaign, id) |> Repo.preload([:vehicles])
    render conn, "show.json", campaign: campaign
  end
end
