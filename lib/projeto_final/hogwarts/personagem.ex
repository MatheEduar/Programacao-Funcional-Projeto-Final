defmodule ProjetoFinal.Hogwarts.Personagem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "personagens" do
    field :image, :string
    field :fullName, :string
    field :hogwartsHouse, :string
    field :interpretedBy, :string
    field :birthdate, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(personagem, attrs) do
    personagem
    |> cast(attrs, [:fullName, :hogwartsHouse, :interpretedBy, :image, :birthdate])
    |> validate_required([:fullName, :hogwartsHouse, :interpretedBy, :image, :birthdate])
  end
end
