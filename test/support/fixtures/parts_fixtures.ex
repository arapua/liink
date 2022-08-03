defmodule Liink.PartsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Liink.Parts` context.
  """

  @doc """
  Generate a spare_parts.
  """
  def spare_parts_fixture(attrs \\ %{}) do
    {:ok, spare_parts} =
      attrs
      |> Enum.into(%{
        description: "some description",
        device: "some device",
        link: "some link",
        name: "some name",
        picture: "some picture"
      })
      |> Liink.Parts.create_spare_parts()

    spare_parts
  end
end
