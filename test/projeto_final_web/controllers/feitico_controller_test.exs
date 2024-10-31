defmodule ProjetoFinalWeb.FeiticoControllerTest do
  use ProjetoFinalWeb.ConnCase

  import ProjetoFinal.HogwartsFixtures

  @create_attrs %{nome: "some nome", descricao: "some descricao"}
  @update_attrs %{nome: "some updated nome", descricao: "some updated descricao"}
  @invalid_attrs %{nome: nil, descricao: nil}

  describe "index" do
    test "lists all feiticos", %{conn: conn} do
      conn = get(conn, ~p"/feiticos")
      assert html_response(conn, 200) =~ "Listing Feiticos"
    end
  end

  describe "new feitico" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/feiticos/new")
      assert html_response(conn, 200) =~ "New Feitico"
    end
  end

  describe "create feitico" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/feiticos", feitico: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/feiticos/#{id}"

      conn = get(conn, ~p"/feiticos/#{id}")
      assert html_response(conn, 200) =~ "Feitico #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/feiticos", feitico: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Feitico"
    end
  end

  describe "edit feitico" do
    setup [:create_feitico]

    test "renders form for editing chosen feitico", %{conn: conn, feitico: feitico} do
      conn = get(conn, ~p"/feiticos/#{feitico}/edit")
      assert html_response(conn, 200) =~ "Edit Feitico"
    end
  end

  describe "update feitico" do
    setup [:create_feitico]

    test "redirects when data is valid", %{conn: conn, feitico: feitico} do
      conn = put(conn, ~p"/feiticos/#{feitico}", feitico: @update_attrs)
      assert redirected_to(conn) == ~p"/feiticos/#{feitico}"

      conn = get(conn, ~p"/feiticos/#{feitico}")
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, feitico: feitico} do
      conn = put(conn, ~p"/feiticos/#{feitico}", feitico: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Feitico"
    end
  end

  describe "delete feitico" do
    setup [:create_feitico]

    test "deletes chosen feitico", %{conn: conn, feitico: feitico} do
      conn = delete(conn, ~p"/feiticos/#{feitico}")
      assert redirected_to(conn) == ~p"/feiticos"

      assert_error_sent 404, fn ->
        get(conn, ~p"/feiticos/#{feitico}")
      end
    end
  end

  defp create_feitico(_) do
    feitico = feitico_fixture()
    %{feitico: feitico}
  end
end
