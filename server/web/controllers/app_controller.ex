defmodule BdPro.AppController do
  use BdPro.Web, :controller

  def show(conn, _params) do
    html conn, response_for_env(Mix.env)
  end

  def response_for_env(:prod) do
    HTTPoison.get!("http://busdetective-pro.s3.amazonaws.com/index.html")
  end

  def response_for_env(:test) do
    File.read!("priv/static/index.html")
  end

  def response_for_env(:dev) do
    "Please visit the ember app at localhost:5000"
  end
end
