defmodule HealthChecker.Management.Component do
  use Ecto.Schema
  import Ecto.Changeset


  schema "components" do
    field :endpoint, :string
    field :name, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(component, attrs) do
    component
    |> cast(attrs, [:name, :endpoint, :status])
    |> validate_required([:name, :endpoint, :status])
  end
end
