defmodule BdPro.Mixfile do
  use Mix.Project

  def project do
    [app: :bd_pro,
      version: "0.0.1",
      elixir: "~> 1.0",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix] ++ Mix.compilers,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {BdPro, []},
      applications: applications(Mix.env)
    ]
  end

  def applications(:test) do
    [:hound, :ex_machina] ++ applications(:dev)
  end

  def applications(_) do
    [
      :phoenix,
      :phoenix_html,
      :cowboy,
      :logger,
      :phoenix_ecto,
      :postgrex,
      :httpoison,
      :tzdata
    ]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.0.2"},
      {:phoenix_ecto, "~> 1.2"},
      {:postgrex, ">= 0.0.0"},
      {:httpoison, "~> 0.7.2"},
      {:phoenix_html, "~> 2.1"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:cowboy, "~> 1.0"},
      {:hound, "~> 0.7.0" },
      {:exprotobuf, "~> 0.11.0"},
      {:timex, "~> 0.19.4"},
      {:geo, "~> 0.16.0"},
      {:ex_machina, "~> 0.2"}]
  end
end
