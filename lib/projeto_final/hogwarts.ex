defmodule ProjetoFinal.Hogwarts do
  @moduledoc """
  The Hogwarts context.
  """

  import Ecto.Query, warn: false
  alias ProjetoFinal.Repo

  alias ProjetoFinal.Hogwarts.Personagem

  @doc """
  Returns the list of personagens.

  ## Examples

      iex> list_personagens()
      [%Personagem{}, ...]

  """
  def list_personagens do
    Repo.all(Personagem)
  end

  @doc """
  Gets a single personagem.

  Raises `Ecto.NoResultsError` if the Personagem does not exist.

  ## Examples

      iex> get_personagem!(123)
      %Personagem{}

      iex> get_personagem!(456)
      ** (Ecto.NoResultsError)

  """
  def get_personagem!(id), do: Repo.get!(Personagem, id)

  @doc """
  Creates a personagem.

  ## Examples

      iex> create_personagem(%{field: value})
      {:ok, %Personagem{}}

      iex> create_personagem(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_personagem(attrs \\ %{}) do
    %Personagem{}
    |> Personagem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a personagem.

  ## Examples

      iex> update_personagem(personagem, %{field: new_value})
      {:ok, %Personagem{}}

      iex> update_personagem(personagem, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_personagem(%Personagem{} = personagem, attrs) do
    personagem
    |> Personagem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a personagem.

  ## Examples

      iex> delete_personagem(personagem)
      {:ok, %Personagem{}}

      iex> delete_personagem(personagem)
      {:error, %Ecto.Changeset{}}

  """
  def delete_personagem(%Personagem{} = personagem) do
    Repo.delete(personagem)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking personagem changes.

  ## Examples

      iex> change_personagem(personagem)
      %Ecto.Changeset{data: %Personagem{}}

  """
  def change_personagem(%Personagem{} = personagem, attrs \\ %{}) do
    Personagem.changeset(personagem, attrs)
  end

  alias ProjetoFinal.Hogwarts.Feitico

  @doc """
  Returns the list of feiticos.

  ## Examples

      iex> list_feiticos()
      [%Feitico{}, ...]

  """
  def list_feiticos do
    Repo.all(Feitico)
  end

  @doc """
  Gets a single feitico.

  Raises `Ecto.NoResultsError` if the Feitico does not exist.

  ## Examples

      iex> get_feitico!(123)
      %Feitico{}

      iex> get_feitico!(456)
      ** (Ecto.NoResultsError)

  """
  def get_feitico!(id), do: Repo.get!(Feitico, id)

  @doc """
  Creates a feitico.

  ## Examples

      iex> create_feitico(%{field: value})
      {:ok, %Feitico{}}

      iex> create_feitico(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_feitico(attrs \\ %{}) do
    %Feitico{}
    |> Feitico.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a feitico.

  ## Examples

      iex> update_feitico(feitico, %{field: new_value})
      {:ok, %Feitico{}}

      iex> update_feitico(feitico, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_feitico(%Feitico{} = feitico, attrs) do
    feitico
    |> Feitico.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a feitico.

  ## Examples

      iex> delete_feitico(feitico)
      {:ok, %Feitico{}}

      iex> delete_feitico(feitico)
      {:error, %Ecto.Changeset{}}

  """
  def delete_feitico(%Feitico{} = feitico) do
    Repo.delete(feitico)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking feitico changes.

  ## Examples

      iex> change_feitico(feitico)
      %Ecto.Changeset{data: %Feitico{}}

  """
  def change_feitico(%Feitico{} = feitico, attrs \\ %{}) do
    Feitico.changeset(feitico, attrs)
  end
end
