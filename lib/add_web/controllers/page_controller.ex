defmodule AddWeb.PageController do
  use AddWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
