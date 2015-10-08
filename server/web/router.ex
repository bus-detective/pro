defmodule BdPro.Router do
  use BdPro.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug BdPro.Plugs.CheckAuthentication
  end

  scope "/api", BdPro do
    pipe_through :api

    resources "/campaigns", CampaignController
    resources "/vehicle_positions", VehiclePositionController
    resources "/demographic_reports", DemographicReportController
    resources "/session", SessionController, singleton: true
  end

  scope "/", BdPro do
    pipe_through :browser

    get "*app_path", AppController, :show
  end
end
