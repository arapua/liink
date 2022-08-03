defmodule Liink.Repo.Migrations.CreateParts do
  use Ecto.Migration

  def change do
    create table(:parts) do
      add :link, :string
      add :picture, :string
      add :device, :string
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
