defmodule ProjetoFinalWeb.FeiticoController do
  use ProjetoFinalWeb, :controller

  alias ProjetoFinal.Hogwarts
  alias ProjetoFinal.Hogwarts.Feitico

  def index(conn, _params) do
    feiticos = Hogwarts.list_feiticos()
    render(conn, :index, feiticos: feiticos)
  end

  def new(conn, _params) do
    changeset = Hogwarts.change_feitico(%Feitico{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"feitico" => feitico_params}) do
    case Hogwarts.create_feitico(feitico_params) do
      {:ok, feitico} ->
        conn
        |> put_flash(:info, "Feitico created successfully.")
        |> redirect(to: ~p"/feiticos/#{feitico}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    feitico = Hogwarts.get_feitico!(id)
    render(conn, :show, feitico: feitico, layout: false)
  end

  def edit(conn, %{"id" => id}) do
    feitico = Hogwarts.get_feitico!(id)
    changeset = Hogwarts.change_feitico(feitico)
    render(conn, :edit, feitico: feitico, changeset: changeset)
  end

  def update(conn, %{"id" => id, "feitico" => feitico_params}) do
    feitico = Hogwarts.get_feitico!(id)

    case Hogwarts.update_feitico(feitico, feitico_params) do
      {:ok, feitico} ->
        conn
        |> put_flash(:info, "Feitico updated successfully.")
        |> redirect(to: ~p"/feiticos/#{feitico}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, feitico: feitico, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    feitico = Hogwarts.get_feitico!(id)
    {:ok, _feitico} = Hogwarts.delete_feitico(feitico)

    conn
    |> put_flash(:info, "Feitico deleted successfully.")
    |> redirect(to: ~p"/feiticos")
  end
end
