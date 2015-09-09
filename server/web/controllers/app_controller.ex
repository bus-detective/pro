defmodule BdPro.AppController do
  use BdPro.Web, :controller

  def show(conn, _params) do
    s3_response = HTTPoison.get!("http://busdetective-pro.s3.amazonaws.com/index.html")
    html conn, s3_response.body
  end
end
