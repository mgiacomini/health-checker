# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :health_checker_web,
  namespace: HealthCheckerWeb,
  ecto_repos: [HealthChecker.Repo]

# Configures the endpoint
config :health_checker_web, HealthCheckerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CRkNpze9FAonFimR1k8jWnDk/hIqfLwqErgUkDhK8mbz7JTb/vIBqoaqrpBxQMjJ",
  render_errors: [view: HealthCheckerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HealthCheckerWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :health_checker_web, :generators,
  context_app: :health_checker

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
