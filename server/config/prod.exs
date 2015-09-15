use Mix.Config

config :bd_pro, BdPro.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [shceme: "https", host: "busdetective-pro.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]]

config :logger, level: :info

config :bd_pro, BdPro.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :bd_pro, BdPro.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20

