defmodule ProjetoFinalWeb.PageController do
  use ProjetoFinalWeb, :controller

  alias ProjetoFinal.Hogwarts

  def index(conn, _params) do
    personagens = Hogwarts.list_personagens()
    feiticos = Hogwarts.list_feiticos()
    
    render(conn, "index.html", personagens: personagens, feiticos: feiticos, layout: false)
  end

end
