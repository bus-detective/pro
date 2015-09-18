defmodule BdPro.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Hound.Helpers
      alias BdPro.Repo
      hound_session
    end
  end

  setup_all do
    System.cmd("ln", ["-s", "../client/dist/index.html", "./priv/static"])
    System.cmd("ln", ["-s", "../client/dist/assets/", "./priv/static"])
    on_exit fn ->
      System.cmd("rm", ["./priv/static/index.html"])
      System.cmd("rm", ["./priv/static/assets"])
      :ok
    end
  end

  setup do
    BdPro.Endpoint.start_link
    :ok
  end
end
