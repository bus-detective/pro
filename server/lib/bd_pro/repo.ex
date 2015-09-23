defmodule BdPro.Repo do
  use Ecto.Repo, otp_app: :bd_pro

  def execute(sql, params \\ []) do
    Ecto.Adapters.SQL.query!(__MODULE__, sql, params)
  end

  def hydrate(response, model) do
    Enum.map response.rows, fn(row) ->
      fields = Enum.reduce(Enum.zip(response.columns, row), %{}, fn({key, value}, map) ->
        Map.put(map, key, value)
      end)

      Ecto.Schema.__load__(model, nil, nil, [], fields, &__MODULE__.__adapter__.load/2)
    end
  end
end
