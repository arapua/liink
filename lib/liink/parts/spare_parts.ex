defmodule Liink.Parts.SpareParts do
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
    |> cast(attrs, [:link, :picture, :device, :name, :description])
    |> validate_required([:link, :picture, :device, :name, :description])
  end
end
