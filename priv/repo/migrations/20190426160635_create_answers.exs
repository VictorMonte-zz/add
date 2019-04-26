defmodule Add.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :cycle, :string
      add :commentary, :string
      add :question_id, references(:questions, on_delete: :nothing)
      add :level_id, references(:levels, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:answers, [:question_id])
    create index(:answers, [:level_id])
    create index(:answers, [:user_id])
  end
end
