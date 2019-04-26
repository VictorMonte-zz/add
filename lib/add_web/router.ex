defmodule AddWeb.Router do
  use AddWeb, :router

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

  scope "/", AddWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", AddWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/questions", QuestionController, except: [:new, :edit]
  end
end
