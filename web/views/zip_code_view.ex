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
      code: zip_code.zip_code,
      count: count,
      shape: format_shape(zip_code.shape)
    }
  end

  defp format_shape(shape) do
    shape = Geo.JSON.encode(shape)
    coords = shape["coordinates"]
    new_shape = Enum.map(coords, fn(sub_coordinates) ->
      Enum.map(sub_coordinates, fn(third_sub_coordinates) ->
        Enum.map(third_sub_coordinates, &Enum.reverse(&1))
      end)
    end)
    %Geo.MultiPolygon{ coordinates: new_shape }
  end
end
