defmodule BdPro.DemographicController do
  use BdPro.Web, :controller

  alias BdPro.DemographicQuery

  def index(conn, params) do
    render conn, "index.json", demographics: DemographicQuery.search(params)
  end
end
