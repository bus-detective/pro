defmodule BdPro.ReportView do
  use BdPro.Web, :view
  use JaSerializer.PhoenixView

  attributes [:name, :vehicles]

  defimpl Poison.Encoder, for: BdPro.Vehicle do
    def encode(model, opts) do
      model
        |> Map.take([:campaign_id, :remote_id])
        |> Poison.Encoder.encode(opts)
    end
  end
end