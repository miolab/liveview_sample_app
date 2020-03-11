defmodule LvSampleWeb.Router do
  use LvSampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_live_layout, {LvSampleWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LvSampleWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/realtime", QiitaSearchRealtime
  end

  # Other scopes may use custom stacks.
  # scope "/api", LvSampleWeb do
  #   pipe_through :api
  # end
end
