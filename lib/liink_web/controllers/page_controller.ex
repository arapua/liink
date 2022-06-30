defmodule LiinkWeb.PageController do
  use LiinkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
