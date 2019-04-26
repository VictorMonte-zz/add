defmodule Add.Evaluation.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :commentary, :string
    field :cycle, :string
    field :question_id, :id
    field :level_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:cycle, :commentary, :question_id, :level_id, :user_id])
    |> validate_required([:cycle, :commentary])
  end
end
