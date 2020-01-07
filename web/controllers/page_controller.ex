defmodule MyBff.PageController do
  use MyBff.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
