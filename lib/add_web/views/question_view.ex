defmodule AddWeb.QuestionView do
  use AddWeb, :view
  alias AddWeb.QuestionView

  def render("index.json", %{questions: questions}) do
    %{data: render_many(questions, QuestionView, "question.json")}
  end

  def render("show.json", %{question: question}) do
    %{data: render_one(question, QuestionView, "question.json")}
  end

  def render("question.json", %{question: question}) do
    %{id: question.id,
      description: question.description}
  end
end
