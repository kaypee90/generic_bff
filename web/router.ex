defmodule MyBff.Router do
  use MyBff.Web, :router

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

  scope "/", MyBff do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", MyBff do
    pipe_through :api

    get "/generic", GenericController, :index
    get "/generic/:id", GenericController, :show
    post "/generic", GenericController, :create
    put "/generic/:id", GenericController, :update
  end
end
