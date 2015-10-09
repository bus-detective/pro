defmodule BdPro.FeatureCase do
  use ExUnit.CaseTemplate

  @ember_build_files ~w(index.html crossdomain.xml)

  using do
    quote do
      import BdPro.Factories
      use Hound.Helpers
      alias BdPro.Repo
      hound_session

      def sign_in_generic_user do
        generic_user = create(:user)
        BdPro.SignInPage.visit
        BdPro.SignInPage.sign_in(generic_user)
        BdPro.SignInPage.signed_in?
        generic_user
      end
    end
  end

  setup_all do
    if !File.exists?("priv/static/index.html") do
      build_ember
    end
    System.at_exit fn (status) -> clean_ember end
    :ok
  end

  setup do
    BdPro.Endpoint.start_link
    :ok
  end

  defp build_ember do
    Mix.shell.info("Building ember")
    System.cmd("ember", ["build", "--output-path", "../priv/static", "--environment", "ci"], cd: "client")
  end

  defp clean_ember do
    Mix.shell.info("Cleaning ember")
    @ember_build_files |> Enum.each(&File.rm("priv/static/#{&1}"))
  end
end
