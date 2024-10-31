defmodule ProjetoFinalWeb.FeiticoHTML do
  use ProjetoFinalWeb, :html

  embed_templates "feitico_html/*"

  @doc """
  Renders a feitico form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def feitico_form(assigns)
end
