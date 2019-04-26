defmodule Add.IdentificationTest do
  use Add.DataCase

  alias Add.Identification

  describe "users" do
    alias Add.Identification.User

    @valid_attrs %{cpf: "some cpf"}
    @update_attrs %{cpf: "some updated cpf"}
    @invalid_attrs %{cpf: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Identification.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Identification.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Identification.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Identification.create_user(@valid_attrs)
      assert user.cpf == "some cpf"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identification.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Identification.update_user(user, @update_attrs)
      assert user.cpf == "some updated cpf"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Identification.update_user(user, @invalid_attrs)
      assert user == Identification.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Identification.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Identification.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Identification.change_user(user)
    end
  end
end
