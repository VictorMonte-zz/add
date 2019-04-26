defmodule AddWeb.AnswerController do
  use AddWeb, :controller

  alias Add.Evaluation
  alias Add.Evaluation.Answer

  action_fallback AddWeb.FallbackController

  def index(conn, _params) do
    answers = Evaluation.list_answers()
    render(conn, "index.json", answers: answers)
  end

  def create(conn, %{"answer" => answer_params}) do
    with {:ok, %Answer{} = answer} <- Evaluation.create_answer(answer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.answer_path(conn, :show, answer))
      |> render("show.json", answer: answer)
    end
  end

  def show(conn, %{"id" => id}) do
    answer = Evaluation.get_answer!(id)
    render(conn, "show.json", answer: answer)
  end

  def update(conn, %{"id" => id, "answer" => answer_params}) do
    answer = Evaluation.get_answer!(id)

    with {:ok, %Answer{} = answer} <- Evaluation.update_answer(answer, answer_params) do
      render(conn, "show.json", answer: answer)
    end
  end

  def delete(conn, %{"id" => id}) do
    answer = Evaluation.get_answer!(id)

    with {:ok, %Answer{}} <- Evaluation.delete_answer(answer) do
      send_resp(conn, :no_content, "")
    end
  end
end
