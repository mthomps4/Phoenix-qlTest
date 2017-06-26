defmodule QlTest.Web.PageController do
  use QlTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
