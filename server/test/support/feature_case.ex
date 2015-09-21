defmodule BdPro.FeatureCase do
  use ExUnit.CaseTemplate

  @ember_build_files ~w(index.html crossdomain.xml)

  using do
    quote do
      use Hound.Helpers
      alias BdPro.Repo
      hound_session
    end
  end

  setup_all do
    if !File.exists?("priv/static/index.html") do
      build_ember
      System.at_exit fn (status) -> clean_ember end
    end
    :ok
  end

  setup do
    BdPro.Endpoint.start_link
    :ok
  end

  defp build_ember do
    Mix.shell.info("Building ember")
    System.cmd("ember", ["build", "--output-path", "../server/priv/static", "--environment", "ci"], cd: "../client")
  end

  defp clean_ember do
    Mix.shell.info("Cleaning ember")
    @ember_build_files |> Enum.each(&File.rm!("priv/static/#{&1}"))
  end
end
