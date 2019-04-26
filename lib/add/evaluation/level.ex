defmodule Add.Evaluation.Level do
  use Ecto.Schema
  import Ecto.Changeset

  schema "levels" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(level, attrs) do
    level
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
