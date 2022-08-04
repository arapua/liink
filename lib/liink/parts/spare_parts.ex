defmodule Liink.Parts.SpareParts do
  @moduledoc """
    SpareParts is the representation of parts and the link to buy then
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "parts" do
    field(:description, :string)
    field(:device, :string)
    field(:link, :string)
    field(:name, :string)
    field(:picture, :string)

    timestamps()
  end

  @doc false
  def changeset(spare_parts, attrs) do
    spare_parts
    |> cast(attrs, [:link, :device, :name])
    |> validate_required([:link, :device, :name])
  end
end
