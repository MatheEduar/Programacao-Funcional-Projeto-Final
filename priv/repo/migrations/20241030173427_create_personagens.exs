defmodule ProjetoFinal.Repo.Migrations.CreatePersonagens do
  use Ecto.Migration

  def change do
    create table(:personagens) do
      add :fullName, :string
      add :hogwartsHouse, :string
      add :interpretedBy, :string
      add :image, :string
      add :birthdate, :string

      timestamps(type: :utc_datetime)
    end
  end
end
