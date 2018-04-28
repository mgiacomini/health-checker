use Mix.Config

# Configure your database
config :health_checker, HealthChecker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "health_checker_dev",
  hostname: "localhost",
  pool_size: 10
