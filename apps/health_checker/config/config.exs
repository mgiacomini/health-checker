use Mix.Config

config :health_checker, ecto_repos: [HealthChecker.Repo]

import_config "#{Mix.env}.exs"
