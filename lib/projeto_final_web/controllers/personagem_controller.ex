defmodule ProjetoFinalWeb.PersonagemController do
  use ProjetoFinalWeb, :controller

  alias ProjetoFinal.Hogwarts
  alias ProjetoFinal.Hogwarts.Personagem

  def index(conn, _params) do
    personagens = Hogwarts.list_personagens()
    render(conn, :index, personagens: personagens, layout: false)
  end

  def new(conn, _params) do
    changeset = Hogwarts.change_personagem(%Personagem{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"personagem" => personagem_params}) do
    case Hogwarts.create_personagem(personagem_params) do
      {:ok, personagem} ->
        conn
        |> put_flash(:info, "Personagem created successfully.")
        |> redirect(to: ~p"/personagens/#{personagem}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    personagem = Hogwarts.get_personagem!(id)
    render(conn, :show, personagem: personagem, layout: false)
  end

  def edit(conn, %{"id" => id}) do
    personagem = Hogwarts.get_personagem!(id)
    changeset = Hogwarts.change_personagem(personagem)
    render(conn, :edit, personagem: personagem, changeset: changeset)
  end

  def update(conn, %{"id" => id, "personagem" => personagem_params}) do
    personagem = Hogwarts.get_personagem!(id)

    case Hogwarts.update_personagem(personagem, personagem_params) do
      {:ok, personagem} ->
        conn
        |> put_flash(:info, "Personagem updated successfully.")
        |> redirect(to: ~p"/personagens/#{personagem}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, personagem: personagem, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    personagem = Hogwarts.get_personagem!(id)
    {:ok, _personagem} = Hogwarts.delete_personagem(personagem)

    conn
    |> put_flash(:info, "Personagem deleted successfully.")
    |> redirect(to: ~p"/personagens")
  end
end
