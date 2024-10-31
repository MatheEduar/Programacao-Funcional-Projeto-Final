defmodule ProjetoFinal.HogwartsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjetoFinal.Hogwarts` context.
  """

  @doc """
  Generate a personagem.
  """
  def personagem_fixture(attrs \\ %{}) do
    {:ok, personagem} =
      attrs
      |> Enum.into(%{
        birthdate: "some birthdate",
        fullName: "some fullName",
        hogwartsHouse: "some hogwartsHouse",
        image: "some image",
        interpretedBy: "some interpretedBy"
      })
      |> ProjetoFinal.Hogwarts.create_personagem()

    personagem
  end

  @doc """
  Generate a feitico.
  """
  def feitico_fixture(attrs \\ %{}) do
    {:ok, feitico} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao",
        nome: "some nome"
      })
      |> ProjetoFinal.Hogwarts.create_feitico()

    feitico
  end
end
