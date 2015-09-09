defmodule BdPro.PageController do
  use BdPro.Web, :controller

  def index(conn, _params) do
    s3_response = HTTPoison.get!("http://busdetective-pro.s3.amazonaws.com/index.html")
    html conn, s3_response.body
  end
end
