defmodule HealthChecker.ManagementTest do
  use HealthChecker.DataCase

  alias HealthChecker.Management

  describe "components" do
    alias HealthChecker.Management.Component

    @valid_attrs %{endpoint: "some endpoint", name: "some name", status: "some status"}
    @update_attrs %{endpoint: "some updated endpoint", name: "some updated name", status: "some updated status"}
    @invalid_attrs %{endpoint: nil, name: nil, status: nil}

    def component_fixture(attrs \\ %{}) do
      {:ok, component} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_component()

      component
    end

    test "list_components/0 returns all components" do
      component = component_fixture()
      assert Management.list_components() == [component]
    end

    test "get_component!/1 returns the component with given id" do
      component = component_fixture()
      assert Management.get_component!(component.id) == component
    end

    test "create_component/1 with valid data creates a component" do
      assert {:ok, %Component{} = component} = Management.create_component(@valid_attrs)
      assert component.endpoint == "some endpoint"
      assert component.name == "some name"
      assert component.status == "some status"
    end

    test "create_component/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_component(@invalid_attrs)
    end

    test "update_component/2 with valid data updates the component" do
      component = component_fixture()
      assert {:ok, component} = Management.update_component(component, @update_attrs)
      assert %Component{} = component
      assert component.endpoint == "some updated endpoint"
      assert component.name == "some updated name"
      assert component.status == "some updated status"
    end

    test "update_component/2 with invalid data returns error changeset" do
      component = component_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_component(component, @invalid_attrs)
      assert component == Management.get_component!(component.id)
    end

    test "delete_component/1 deletes the component" do
      component = component_fixture()
      assert {:ok, %Component{}} = Management.delete_component(component)
      assert_raise Ecto.NoResultsError, fn -> Management.get_component!(component.id) end
    end

    test "change_component/1 returns a component changeset" do
      component = component_fixture()
      assert %Ecto.Changeset{} = Management.change_component(component)
    end
  end
end
