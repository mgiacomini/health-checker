defmodule HealthCheckerWeb.PageController do
  use HealthCheckerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
