defmodule DrgSiteWeb.Router do
  use DrgSiteWeb, :router

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

  scope "/", DrgSiteWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/cn_drgs", PageController, :cn_drgs
    get "/working", PageController, :working
    get "/goverment", PageController, :goverment
    get "/application", PageController, :application
    get "/technical", PageController, :technical
    get "/test", PageController, :test
  end

  # Other scopes may use custom stacks.
  # scope "/api", DrgSiteWeb do
  #   pipe_through :api
  # end
end
