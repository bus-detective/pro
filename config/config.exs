# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :bd_pro, BdPro.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "VjZZw3F07DJAhWO0+8qoODyiFxFOdpZAq6YfMHEpmr/laVcCkWj36juRR9lEDd6x",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: BdPro.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :bd_pro, BdPro.Repo,
  extensions: [{Geo.PostGIS.Extension, library: Geo}]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
