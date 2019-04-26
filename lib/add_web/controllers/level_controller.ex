defmodule AddWeb.LevelController do
  use AddWeb, :controller

  alias Add.Evaluation
  alias Add.Evaluation.Level

  action_fallback AddWeb.FallbackController

  def index(conn, _params) do
    levels = Evaluation.list_levels()
    render(conn, "index.json", levels: levels)
  end

  def create(conn, %{"level" => level_params}) do
    with {:ok, %Level{} = level} <- Evaluation.create_level(level_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.level_path(conn, :show, level))
      |> render("show.json", level: level)
    end
  end

  def show(conn, %{"id" => id}) do
    level = Evaluation.get_level!(id)
    render(conn, "show.json", level: level)
  end

  def update(conn, %{"id" => id, "level" => level_params}) do
    level = Evaluation.get_level!(id)

    with {:ok, %Level{} = level} <- Evaluation.update_level(level, level_params) do
      render(conn, "show.json", level: level)
    end
  end

  def delete(conn, %{"id" => id}) do
    level = Evaluation.get_level!(id)

    with {:ok, %Level{}} <- Evaluation.delete_level(level) do
      send_resp(conn, :no_content, "")
    end
  end
end
