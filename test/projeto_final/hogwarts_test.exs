defmodule ProjetoFinal.HogwartsTest do
  use ProjetoFinal.DataCase

  alias ProjetoFinal.Hogwarts

  describe "personagens" do
    alias ProjetoFinal.Hogwarts.Personagem

    import ProjetoFinal.HogwartsFixtures

    @invalid_attrs %{image: nil, fullName: nil, hogwartsHouse: nil, interpretedBy: nil, birthdate: nil}

    test "list_personagens/0 returns all personagens" do
      personagem = personagem_fixture()
      assert Hogwarts.list_personagens() == [personagem]
    end

    test "get_personagem!/1 returns the personagem with given id" do
      personagem = personagem_fixture()
      assert Hogwarts.get_personagem!(personagem.id) == personagem
    end

    test "create_personagem/1 with valid data creates a personagem" do
      valid_attrs = %{image: "some image", fullName: "some fullName", hogwartsHouse: "some hogwartsHouse", interpretedBy: "some interpretedBy", birthdate: "some birthdate"}

      assert {:ok, %Personagem{} = personagem} = Hogwarts.create_personagem(valid_attrs)
      assert personagem.image == "some image"
      assert personagem.fullName == "some fullName"
      assert personagem.hogwartsHouse == "some hogwartsHouse"
      assert personagem.interpretedBy == "some interpretedBy"
      assert personagem.birthdate == "some birthdate"
    end

    test "create_personagem/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hogwarts.create_personagem(@invalid_attrs)
    end

    test "update_personagem/2 with valid data updates the personagem" do
      personagem = personagem_fixture()
      update_attrs = %{image: "some updated image", fullName: "some updated fullName", hogwartsHouse: "some updated hogwartsHouse", interpretedBy: "some updated interpretedBy", birthdate: "some updated birthdate"}

      assert {:ok, %Personagem{} = personagem} = Hogwarts.update_personagem(personagem, update_attrs)
      assert personagem.image == "some updated image"
      assert personagem.fullName == "some updated fullName"
      assert personagem.hogwartsHouse == "some updated hogwartsHouse"
      assert personagem.interpretedBy == "some updated interpretedBy"
      assert personagem.birthdate == "some updated birthdate"
    end

    test "update_personagem/2 with invalid data returns error changeset" do
      personagem = personagem_fixture()
      assert {:error, %Ecto.Changeset{}} = Hogwarts.update_personagem(personagem, @invalid_attrs)
      assert personagem == Hogwarts.get_personagem!(personagem.id)
    end

    test "delete_personagem/1 deletes the personagem" do
      personagem = personagem_fixture()
      assert {:ok, %Personagem{}} = Hogwarts.delete_personagem(personagem)
      assert_raise Ecto.NoResultsError, fn -> Hogwarts.get_personagem!(personagem.id) end
    end

    test "change_personagem/1 returns a personagem changeset" do
      personagem = personagem_fixture()
      assert %Ecto.Changeset{} = Hogwarts.change_personagem(personagem)
    end
  end

  describe "feiticos" do
    alias ProjetoFinal.Hogwarts.Feitico

    import ProjetoFinal.HogwartsFixtures

    @invalid_attrs %{nome: nil, descricao: nil}

    test "list_feiticos/0 returns all feiticos" do
      feitico = feitico_fixture()
      assert Hogwarts.list_feiticos() == [feitico]
    end

    test "get_feitico!/1 returns the feitico with given id" do
      feitico = feitico_fixture()
      assert Hogwarts.get_feitico!(feitico.id) == feitico
    end

    test "create_feitico/1 with valid data creates a feitico" do
      valid_attrs = %{nome: "some nome", descricao: "some descricao"}

      assert {:ok, %Feitico{} = feitico} = Hogwarts.create_feitico(valid_attrs)
      assert feitico.nome == "some nome"
      assert feitico.descricao == "some descricao"
    end

    test "create_feitico/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hogwarts.create_feitico(@invalid_attrs)
    end

    test "update_feitico/2 with valid data updates the feitico" do
      feitico = feitico_fixture()
      update_attrs = %{nome: "some updated nome", descricao: "some updated descricao"}

      assert {:ok, %Feitico{} = feitico} = Hogwarts.update_feitico(feitico, update_attrs)
      assert feitico.nome == "some updated nome"
      assert feitico.descricao == "some updated descricao"
    end

    test "update_feitico/2 with invalid data returns error changeset" do
      feitico = feitico_fixture()
      assert {:error, %Ecto.Changeset{}} = Hogwarts.update_feitico(feitico, @invalid_attrs)
      assert feitico == Hogwarts.get_feitico!(feitico.id)
    end

    test "delete_feitico/1 deletes the feitico" do
      feitico = feitico_fixture()
      assert {:ok, %Feitico{}} = Hogwarts.delete_feitico(feitico)
      assert_raise Ecto.NoResultsError, fn -> Hogwarts.get_feitico!(feitico.id) end
    end

    test "change_feitico/1 returns a feitico changeset" do
      feitico = feitico_fixture()
      assert %Ecto.Changeset{} = Hogwarts.change_feitico(feitico)
    end
  end
end
