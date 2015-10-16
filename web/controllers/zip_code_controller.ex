defmodule BdPro.ZipCodeController do
  use BdPro.Web, :controller
  alias BdPro.ZipCode

  def index(conn, params) do
    render conn, "index.json", results: ZipCode.Query.where(params) |> Repo.all
  end
end
