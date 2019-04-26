defmodule AddWeb.QuestionController do
  use AddWeb, :controller

  alias Add.Accounts
  alias Add.Accounts.Question

  action_fallback AddWeb.FallbackController

  def index(conn, _params) do
    questions = Accounts.list_questions()
    render(conn, "index.json", questions: questions)
  end

  def create(conn, %{"question" => question_params}) do
    with {:ok, %Question{} = question} <- Accounts.create_question(question_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.question_path(conn, :show, question))
      |> render("show.json", question: question)
    end
  end

  def show(conn, %{"id" => id}) do
    question = Accounts.get_question!(id)
    render(conn, "show.json", question: question)
  end

  def update(conn, %{"id" => id, "question" => question_params}) do
    question = Accounts.get_question!(id)

    with {:ok, %Question{} = question} <- Accounts.update_question(question, question_params) do
      render(conn, "show.json", question: question)
    end
  end

  def delete(conn, %{"id" => id}) do
    question = Accounts.get_question!(id)

    with {:ok, %Question{}} <- Accounts.delete_question(question) do
      send_resp(conn, :no_content, "")
    end
  end
end
