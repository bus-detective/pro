defmodule BdPro.QueryCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias BdPro.Repo
      import Ecto.Query, only: [from: 2]
      import Ecto.Adapters.SQL, only: [to_sql: 3]
      @endpoint BdPro.Endpoint

      def sql_params(query) do
        {sql_string, params} = to_sql(:all, Repo, query)
        params
      end
    end
  end

  setup tags do
    unless tags[:async] do
      Ecto.Adapters.SQL.restart_test_transaction(BdPro.Repo, [])
    end

    :ok
  end
end

