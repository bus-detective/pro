use Mix.Config

config :bd_pro, BdPro.Endpoint,
  http: [port: 4001],
  server: true 

# Print only warnings and errors during test
config :logger, level: :warn

# Set a higher stacktrace during test
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :bd_pro, BdPro.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "bd_pro_test",
  pool: Ecto.Adapters.SQL.Sandbox

config :hound, driver: "phantomjs"
