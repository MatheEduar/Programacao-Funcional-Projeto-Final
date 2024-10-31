defmodule ProjetoFinalWeb.PersonagemControllerTest do
  use ProjetoFinalWeb.ConnCase

  import ProjetoFinal.HogwartsFixtures

  @create_attrs %{image: "some image", fullName: "some fullName", hogwartsHouse: "some hogwartsHouse", interpretedBy: "some interpretedBy", birthdate: "some birthdate"}
  @update_attrs %{image: "some updated image", fullName: "some updated fullName", hogwartsHouse: "some updated hogwartsHouse", interpretedBy: "some updated interpretedBy", birthdate: "some updated birthdate"}
  @invalid_attrs %{image: nil, fullName: nil, hogwartsHouse: nil, interpretedBy: nil, birthdate: nil}

  describe "index" do
    test "lists all personagens", %{conn: conn} do
      conn = get(conn, ~p"/personagens")
      assert html_response(conn, 200) =~ "Listing Personagens"
    end
  end

  describe "new personagem" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/personagens/new")
      assert html_response(conn, 200) =~ "New Personagem"
    end
  end

  describe "create personagem" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/personagens", personagem: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/personagens/#{id}"

      conn = get(conn, ~p"/personagens/#{id}")
      assert html_response(conn, 200) =~ "Personagem #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/personagens", personagem: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Personagem"
    end
  end

  describe "edit personagem" do
    setup [:create_personagem]

    test "renders form for editing chosen personagem", %{conn: conn, personagem: personagem} do
      conn = get(conn, ~p"/personagens/#{personagem}/edit")
      assert html_response(conn, 200) =~ "Edit Personagem"
    end
  end

  describe "update personagem" do
    setup [:create_personagem]

    test "redirects when data is valid", %{conn: conn, personagem: personagem} do
      conn = put(conn, ~p"/personagens/#{personagem}", personagem: @update_attrs)
      assert redirected_to(conn) == ~p"/personagens/#{personagem}"

      conn = get(conn, ~p"/personagens/#{personagem}")
      assert html_response(conn, 200) =~ "some updated image"
    end

    test "renders errors when data is invalid", %{conn: conn, personagem: personagem} do
      conn = put(conn, ~p"/personagens/#{personagem}", personagem: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Personagem"
    end
  end

  describe "delete personagem" do
    setup [:create_personagem]

    test "deletes chosen personagem", %{conn: conn, personagem: personagem} do
      conn = delete(conn, ~p"/personagens/#{personagem}")
      assert redirected_to(conn) == ~p"/personagens"

      assert_error_sent 404, fn ->
        get(conn, ~p"/personagens/#{personagem}")
      end
    end
  end

  defp create_personagem(_) do
    personagem = personagem_fixture()
    %{personagem: personagem}
  end
end
