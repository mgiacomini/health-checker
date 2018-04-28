defmodule HealthChecker.Application do
  @moduledoc """
  The HealthChecker Application Service.

  The health_checker system business domain lives in this application.

  Exposes API to clients such as the `HealthCheckerWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(HealthChecker.Repo, []),
    ], strategy: :one_for_one, name: HealthChecker.Supervisor)
  end
end
