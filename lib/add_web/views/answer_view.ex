defmodule AddWeb.AnswerView do
  use AddWeb, :view
  alias AddWeb.AnswerView

  def render("index.json", %{answers: answers}) do
    %{data: render_many(answers, AnswerView, "answer.json")}
  end

  def render("show.json", %{answer: answer}) do
    %{data: render_one(answer, AnswerView, "answer.json")}
  end

  def render("answer.json", %{answer: answer}) do
    %{id: answer.id,
      cycle: answer.cycle,
      commentary: answer.commentary}
  end
end
