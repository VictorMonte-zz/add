defmodule Add.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :description, :string

      timestamps()
    end

  end
end
