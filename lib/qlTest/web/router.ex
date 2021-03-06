defmodule QlTest.Web.Router do
  use QlTest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", QlTest.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", QlTest.Web do
    pipe_through :api
  end

  forward "/graph", Absinthe.Plug,
    schema: QlTest.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: QlTest.Schema
end
