defmodule BdPro.ZipCodeView do
  use BdPro.Web, :view

  def render("index.json", %{ results: results }) do
    %{
      zip_codes: render_many(results, BdPro.ZipCodeView, "zip_code.json")
    }
  end

  def render("zip_code.json", %{zip_code: [zip_code, count]}) do
    %{
      id: zip_code.id,
      zip_code: zip_code.zip_code,
      count: count
    }
  end
end
