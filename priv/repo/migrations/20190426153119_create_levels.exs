defmodule Add.Repo.Migrations.CreateLevels do
  use Ecto.Migration

  def change do
    create table(:levels) do
      add :description, :string

      timestamps()
    end

  end
end
