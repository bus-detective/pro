defmodule BdPro.Repo do
  use Ecto.Repo, otp_app: :bd_pro

  def execute(sql, params \\ []) do
    Ecto.Adapters.SQL.query!(__MODULE__, sql, params)
  end

  def hydrate_struct(sql_response, struct_module) do
    Enum.map sql_response.rows, fn(row) ->
      struct = struct_module.__struct__()
      Enum.reduce(Enum.zip(sql_response.columns, row), struct, fn({key, value}, struct) ->
        Map.put(struct, String.to_atom(key), value)
      end)
    end
  end
end
