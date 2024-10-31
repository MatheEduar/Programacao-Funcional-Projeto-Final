defmodule ProjetoFinalWeb.PersonagemHTML do
  use ProjetoFinalWeb, :html

  embed_templates "personagem_html/*"

  @doc """
  Renders a personagem form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def personagem_form(assigns)
end
