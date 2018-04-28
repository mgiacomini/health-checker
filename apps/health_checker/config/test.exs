use Mix.Config

# Configure your database
config :health_checker, HealthChecker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "mauriciogirardello",
  password: "",
  database: "health_checker_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
