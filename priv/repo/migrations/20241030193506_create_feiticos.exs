defmodule ProjetoFinal.Repo.Migrations.CreateFeiticos do
  use Ecto.Migration

  def change do
    create table(:feiticos) do
      add :nome, :string
      add :descricao, :string

      timestamps(type: :utc_datetime)
    end
  end
end
