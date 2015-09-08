defmodule BdPro.ReportView do
  use BdPro.Web, :view
  use JaSerializer.PhoenixView

  serialize "vehicle_positions" do
    attributes [:lat]
  end
end