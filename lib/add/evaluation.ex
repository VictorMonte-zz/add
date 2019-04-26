defmodule Add.Evaluation do
  @moduledoc """
  The Evaluation context.
  """

  import Ecto.Query, warn: false
  alias Add.Repo

  alias Add.Evaluation.Question

  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{source: %Question{}}

  """
  def change_question(%Question{} = question) do
    Question.changeset(question, %{})
  end

  alias Add.Evaluation.Level

  @doc """
  Returns the list of levels.

  ## Examples

      iex> list_levels()
      [%Level{}, ...]

  """
  def list_levels do
    Repo.all(Level)
  end

  @doc """
  Gets a single level.

  Raises `Ecto.NoResultsError` if the Level does not exist.

  ## Examples

      iex> get_level!(123)
      %Level{}

      iex> get_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_level!(id), do: Repo.get!(Level, id)

  @doc """
  Creates a level.

  ## Examples

      iex> create_level(%{field: value})
      {:ok, %Level{}}

      iex> create_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_level(attrs \\ %{}) do
    %Level{}
    |> Level.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a level.

  ## Examples

      iex> update_level(level, %{field: new_value})
      {:ok, %Level{}}

      iex> update_level(level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_level(%Level{} = level, attrs) do
    level
    |> Level.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Level.

  ## Examples

      iex> delete_level(level)
      {:ok, %Level{}}

      iex> delete_level(level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_level(%Level{} = level) do
    Repo.delete(level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking level changes.

  ## Examples

      iex> change_level(level)
      %Ecto.Changeset{source: %Level{}}

  """
  def change_level(%Level{} = level) do
    Level.changeset(level, %{})
  end

  alias Add.Evaluation.Answer

  @doc """
  Returns the list of answers.

  ## Examples

      iex> list_answers()
      [%Answer{}, ...]

  """
  def list_answers do
    Repo.all(Answer)
  end

  @doc """
  Gets a single answer.

  Raises `Ecto.NoResultsError` if the Answer does not exist.

  ## Examples

      iex> get_answer!(123)
      %Answer{}

      iex> get_answer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_answer!(id), do: Repo.get!(Answer, id)

  @doc """
  Creates a answer.

  ## Examples

      iex> create_answer(%{field: value})
      {:ok, %Answer{}}

      iex> create_answer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_answer(attrs \\ %{}) do
    %Answer{}
    |> Answer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a answer.

  ## Examples

      iex> update_answer(answer, %{field: new_value})
      {:ok, %Answer{}}

      iex> update_answer(answer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_answer(%Answer{} = answer, attrs) do
    answer
    |> Answer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Answer.

  ## Examples

      iex> delete_answer(answer)
      {:ok, %Answer{}}

      iex> delete_answer(answer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_answer(%Answer{} = answer) do
    Repo.delete(answer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking answer changes.

  ## Examples

      iex> change_answer(answer)
      %Ecto.Changeset{source: %Answer{}}

  """
  def change_answer(%Answer{} = answer) do
    Answer.changeset(answer, %{})
  end
end
