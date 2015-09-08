require JaSerializer

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
  end

  scope "/", BdPro do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", BdPro do
    pipe_through :api

    resources "/campaigns", CampaignController
    resources "/reports", ReportController
  end
end
