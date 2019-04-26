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

  describe "levels" do
    alias Add.Evaluation.Level

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def level_fixture(attrs \\ %{}) do
      {:ok, level} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Evaluation.create_level()

      level
    end

    test "list_levels/0 returns all levels" do
      level = level_fixture()
      assert Evaluation.list_levels() == [level]
    end

    test "get_level!/1 returns the level with given id" do
      level = level_fixture()
      assert Evaluation.get_level!(level.id) == level
    end

    test "create_level/1 with valid data creates a level" do
      assert {:ok, %Level{} = level} = Evaluation.create_level(@valid_attrs)
      assert level.description == "some description"
    end

    test "create_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Evaluation.create_level(@invalid_attrs)
    end

    test "update_level/2 with valid data updates the level" do
      level = level_fixture()
      assert {:ok, %Level{} = level} = Evaluation.update_level(level, @update_attrs)
      assert level.description == "some updated description"
    end

    test "update_level/2 with invalid data returns error changeset" do
      level = level_fixture()
      assert {:error, %Ecto.Changeset{}} = Evaluation.update_level(level, @invalid_attrs)
      assert level == Evaluation.get_level!(level.id)
    end

    test "delete_level/1 deletes the level" do
      level = level_fixture()
      assert {:ok, %Level{}} = Evaluation.delete_level(level)
      assert_raise Ecto.NoResultsError, fn -> Evaluation.get_level!(level.id) end
    end

    test "change_level/1 returns a level changeset" do
      level = level_fixture()
      assert %Ecto.Changeset{} = Evaluation.change_level(level)
    end
  end

  describe "answers" do
    alias Add.Evaluation.Answer

    @valid_attrs %{commentary: "some commentary", cycle: "some cycle"}
    @update_attrs %{commentary: "some updated commentary", cycle: "some updated cycle"}
    @invalid_attrs %{commentary: nil, cycle: nil}

    def answer_fixture(attrs \\ %{}) do
      {:ok, answer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Evaluation.create_answer()

      answer
    end

    test "list_answers/0 returns all answers" do
      answer = answer_fixture()
      assert Evaluation.list_answers() == [answer]
    end

    test "get_answer!/1 returns the answer with given id" do
      answer = answer_fixture()
      assert Evaluation.get_answer!(answer.id) == answer
    end

    test "create_answer/1 with valid data creates a answer" do
      assert {:ok, %Answer{} = answer} = Evaluation.create_answer(@valid_attrs)
      assert answer.commentary == "some commentary"
      assert answer.cycle == "some cycle"
    end

    test "create_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Evaluation.create_answer(@invalid_attrs)
    end

    test "update_answer/2 with valid data updates the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{} = answer} = Evaluation.update_answer(answer, @update_attrs)
      assert answer.commentary == "some updated commentary"
      assert answer.cycle == "some updated cycle"
    end

    test "update_answer/2 with invalid data returns error changeset" do
      answer = answer_fixture()
      assert {:error, %Ecto.Changeset{}} = Evaluation.update_answer(answer, @invalid_attrs)
      assert answer == Evaluation.get_answer!(answer.id)
    end

    test "delete_answer/1 deletes the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{}} = Evaluation.delete_answer(answer)
      assert_raise Ecto.NoResultsError, fn -> Evaluation.get_answer!(answer.id) end
    end

    test "change_answer/1 returns a answer changeset" do
      answer = answer_fixture()
      assert %Ecto.Changeset{} = Evaluation.change_answer(answer)
    end
  end
end
