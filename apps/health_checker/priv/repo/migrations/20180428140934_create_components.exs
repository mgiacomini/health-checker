defmodule HealthChecker.Repo.Migrations.CreateComponents do
  use Ecto.Migration

  def change do
    create table(:components) do
      add :name, :string
      add :endpoint, :string
      add :status, :string

      timestamps()
    end

  end
end
