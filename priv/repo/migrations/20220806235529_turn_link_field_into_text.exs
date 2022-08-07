defmodule Liink.Repo.Migrations.TurnLinkFieldIntoText do
  use Ecto.Migration

  def change do
    alter table(:parts) do
      modify(:link, :text)
      modify(:description, :text)
      modify(:device, :text)
    end
  end
end
