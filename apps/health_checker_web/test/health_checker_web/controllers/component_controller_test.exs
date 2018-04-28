defmodule HealthCheckerWeb.ComponentControllerTest do
  use HealthCheckerWeb.ConnCase

  alias HealthChecker.Management

  @create_attrs %{endpoint: "some endpoint", name: "some name", status: "some status"}
  @update_attrs %{endpoint: "some updated endpoint", name: "some updated name", status: "some updated status"}
  @invalid_attrs %{endpoint: nil, name: nil, status: nil}

  def fixture(:component) do
    {:ok, component} = Management.create_component(@create_attrs)
    component
  end

  describe "index" do
    test "lists all components", %{conn: conn} do
      conn = get conn, component_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Components"
    end
  end

  describe "new component" do
    test "renders form", %{conn: conn} do
      conn = get conn, component_path(conn, :new)
      assert html_response(conn, 200) =~ "New Component"
    end
  end

  describe "create component" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, component_path(conn, :create), component: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == component_path(conn, :show, id)

      conn = get conn, component_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Component"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, component_path(conn, :create), component: @invalid_attrs
      assert html_response(conn, 200) =~ "New Component"
    end
  end

  describe "edit component" do
    setup [:create_component]

    test "renders form for editing chosen component", %{conn: conn, component: component} do
      conn = get conn, component_path(conn, :edit, component)
      assert html_response(conn, 200) =~ "Edit Component"
    end
  end

  describe "update component" do
    setup [:create_component]

    test "redirects when data is valid", %{conn: conn, component: component} do
      conn = put conn, component_path(conn, :update, component), component: @update_attrs
      assert redirected_to(conn) == component_path(conn, :show, component)

      conn = get conn, component_path(conn, :show, component)
      assert html_response(conn, 200) =~ "some updated endpoint"
    end

    test "renders errors when data is invalid", %{conn: conn, component: component} do
      conn = put conn, component_path(conn, :update, component), component: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Component"
    end
  end

  describe "delete component" do
    setup [:create_component]

    test "deletes chosen component", %{conn: conn, component: component} do
      conn = delete conn, component_path(conn, :delete, component)
      assert redirected_to(conn) == component_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, component_path(conn, :show, component)
      end
    end
  end

  defp create_component(_) do
    component = fixture(:component)
    {:ok, component: component}
  end
end
