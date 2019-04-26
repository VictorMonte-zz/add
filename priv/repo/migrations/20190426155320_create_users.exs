defmodule Add.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :cpf, :string
      add :user_manager_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:users, [:user_manager_id])
  end
end
