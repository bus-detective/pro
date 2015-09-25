defmodule BdPro.CampaignController do
  use BdPro.Web, :controller

  alias BdPro.Campaign

  plug :scrub_params, "campaign" when action in [:create, :update]

  def index(conn, _params) do
    campaigns = Repo.all(Campaign) |> Repo.preload([:vehicles])
    render(conn, "index.json", campaigns: campaigns)
  end

  def show(conn, %{"id" => id}) do
    campaign = Repo.get!(Campaign, id) |> Repo.preload([:vehicles])
    render conn, "show.json", campaign: campaign
  end

  def create(conn, %{"campaign" => campaign_params}) do
    changeset = Campaign.changeset(%Campaign{}, campaign_params)

    case Repo.insert(changeset) do
      { :ok, campaign } ->
        conn
        |> put_status(:created)
        |> render "show.json", campaign: campaign |> Repo.preload([:vehicles])

      { :error, campaign } ->
        conn
        |> put_status(:unprocessable_entity)
        |> render BdPro.ChangesetView, "error.json", changeset: changeset
    end
  end

  def update(conn, %{"id" => id, "campaign" => campaign_params}) do
    campaign = Repo.get!(Campaign, id)
    changeset = Campaign.changeset(campaign, campaign_params)

    case Repo.update(changeset) do
      { :ok, campaign } ->
        render conn, "show.json", campaign: campaign |> Repo.preload([:vehicles])

      { :error, campaign } ->
        conn
        |> put_status(:unprocessable_entity)
        |> render BdPro.ChangesetView, "error.json", changeset: changeset
    end
  end

  def delete(conn, %{"id" => id}) do
    campaign = Repo.get!(Campaign, id)
    campaign = Repo.delete!(campaign)

    send_resp conn, :no_content, ""
  end
end
