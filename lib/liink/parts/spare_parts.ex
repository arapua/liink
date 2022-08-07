defmodule Liink.Parts.SpareParts do
  @moduledoc """
    SpareParts is the representation of parts and the link to buy then
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "parts" do
    field(:description, :string)
    field(:device, :string)
    field(:link, :string)
    field(:name, :string)
    field(:picture, :string)

    timestamps()
  end

  def search(query, search_term) do
    wildcard_search = "%#{search_term}%"

    from(parts in query,
      where: ilike(parts.name, ^wildcard_search),
      or_where: ilike(parts.device, ^wildcard_search)
    )
  end

  @doc false
  def changeset(spare_parts, attrs) do
    spare_parts
    |> cast(attrs, [:link, :device, :name, :description, :picture])
    |> validate_required([:link, :device, :name])
  end
end
