defmodule Add.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :cpf, :string
      add :user_cpf, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:users, [:user_cpf])
  end
end
