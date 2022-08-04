defmodule Liink.PartsTest do
  use Liink.DataCase

  alias Liink.Parts

  describe "parts" do
    alias Liink.Parts.SpareParts

    import Liink.PartsFixtures

    @invalid_attrs %{description: nil, device: nil, link: nil, name: nil, picture: nil}

    test "list_parts/0 returns all parts" do
      spare_parts = spare_parts_fixture()
      assert Parts.list_parts() == [spare_parts]
    end

    test "get_spare_parts!/1 returns the spare_parts with given id" do
      spare_parts = spare_parts_fixture()
      assert Parts.get_spare_parts!(spare_parts.id) == spare_parts
    end

    test "create_spare_parts/1 with valid data creates a spare_parts" do
      valid_attrs = %{
        description: "some description",
        device: "some device",
        link: "some link",
        name: "some name",
        picture: "some picture"
      }

      assert {:ok, %SpareParts{} = spare_parts} = Parts.create_spare_parts(valid_attrs)
      assert spare_parts.device == "some device"
      assert spare_parts.link == "some link"
      assert spare_parts.name == "some name"
    end

    test "create_spare_parts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Parts.create_spare_parts(@invalid_attrs)
    end

    test "update_spare_parts/2 with valid data updates the spare_parts" do
      spare_parts = spare_parts_fixture()

      update_attrs = %{
        description: "some updated description",
        device: "some updated device",
        link: "some updated link",
        name: "some updated name",
        picture: "some updated picture"
      }

      assert {:ok, %SpareParts{} = spare_parts} =
               Parts.update_spare_parts(spare_parts, update_attrs)

      assert spare_parts.device == "some updated device"
      assert spare_parts.link == "some updated link"
      assert spare_parts.name == "some updated name"
    end

    test "update_spare_parts/2 with invalid data returns error changeset" do
      spare_parts = spare_parts_fixture()
      assert {:error, %Ecto.Changeset{}} = Parts.update_spare_parts(spare_parts, @invalid_attrs)
      assert spare_parts == Parts.get_spare_parts!(spare_parts.id)
    end

    test "delete_spare_parts/1 deletes the spare_parts" do
      spare_parts = spare_parts_fixture()
      assert {:ok, %SpareParts{}} = Parts.delete_spare_parts(spare_parts)
      assert_raise Ecto.NoResultsError, fn -> Parts.get_spare_parts!(spare_parts.id) end
    end

    test "change_spare_parts/1 returns a spare_parts changeset" do
      spare_parts = spare_parts_fixture()
      assert %Ecto.Changeset{} = Parts.change_spare_parts(spare_parts)
    end
  end
end
