defmodule Add.Identification.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :cpf, :string
    field :user_manager_id, :id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:cpf, :user_manager_id])
    |> validate_required([:cpf])
  end
end
