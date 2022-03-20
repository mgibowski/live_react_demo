defmodule LiveReactDemoWeb.Router do
  use LiveReactDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LiveReactDemoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveReactDemoWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/example", ExampleLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveReactDemoWeb do
  #   pipe_through :api
  # end
end
