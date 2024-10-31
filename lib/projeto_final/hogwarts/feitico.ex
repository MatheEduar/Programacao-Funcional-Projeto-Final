defmodule ProjetoFinal.Hogwarts.Feitico do
  use Ecto.Schema
  import Ecto.Changeset

  schema "feiticos" do
    field :nome, :string
    field :descricao, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(feitico, attrs) do
    feitico
    |> cast(attrs, [:nome, :descricao])
    |> validate_required([:nome, :descricao])
  end
end
