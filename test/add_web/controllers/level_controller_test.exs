defmodule AddWeb.LevelControllerTest do
  use AddWeb.ConnCase

  alias Add.Accounts
  alias Add.Accounts.Level

  @create_attrs %{
    description: "some description"
  }
  @update_attrs %{
    description: "some updated description"
  }
  @invalid_attrs %{description: nil}

  def fixture(:level) do
    {:ok, level} = Accounts.create_level(@create_attrs)
    level
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all levels", %{conn: conn} do
      conn = get(conn, Routes.level_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create level" do
    test "renders level when data is valid", %{conn: conn} do
      conn = post(conn, Routes.level_path(conn, :create), level: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.level_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.level_path(conn, :create), level: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update level" do
    setup [:create_level]

    test "renders level when data is valid", %{conn: conn, level: %Level{id: id} = level} do
      conn = put(conn, Routes.level_path(conn, :update, level), level: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.level_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, level: level} do
      conn = put(conn, Routes.level_path(conn, :update, level), level: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete level" do
    setup [:create_level]

    test "deletes chosen level", %{conn: conn, level: level} do
      conn = delete(conn, Routes.level_path(conn, :delete, level))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.level_path(conn, :show, level))
      end
    end
  end

  defp create_level(_) do
    level = fixture(:level)
    {:ok, level: level}
  end
end
