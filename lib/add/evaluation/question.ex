defmodule Add.Evaluation.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
