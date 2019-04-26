defmodule Add.EvaluationTest do
  use Add.DataCase

  alias Add.Evaluation

  describe "questions" do
    alias Add.Evaluation.Question

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Evaluation.create_question()

      question
    end

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Evaluation.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Evaluation.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = Evaluation.create_question(@valid_attrs)
      assert question.description == "some description"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Evaluation.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, %Question{} = question} = Evaluation.update_question(question, @update_attrs)
      assert question.description == "some updated description"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Evaluation.update_question(question, @invalid_attrs)
      assert question == Evaluation.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Evaluation.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Evaluation.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Evaluation.change_question(question)
    end
  end
end
