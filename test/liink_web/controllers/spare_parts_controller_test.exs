defmodule LiinkWeb.SparePartsControllerTest do
  use LiinkWeb.ConnCase

  import Liink.PartsFixtures

  @create_attrs %{
    description: "some description",
    device: "some device",
    link: "some link",
    name: "some name",
    picture: "some picture"
  }
  @update_attrs %{
    description: "some updated description",
    device: "some updated device",
    link: "some updated link",
    name: "some updated name",
    picture: "some updated picture"
  }
  @invalid_attrs %{description: nil, device: nil, link: nil, name: nil, picture: nil}

  describe "index" do
    test "lists all parts", %{conn: conn} do
      conn = get(conn, Routes.spare_parts_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Parts"
    end
  end

  describe "new spare_parts" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.spare_parts_path(conn, :new))
      assert html_response(conn, 200) =~ "New Spare parts"
    end
  end

  describe "create spare_parts" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.spare_parts_path(conn, :create), spare_parts: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.spare_parts_path(conn, :show, id)

      conn = get(conn, Routes.spare_parts_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Link"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.spare_parts_path(conn, :create), spare_parts: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Spare parts"
    end
  end

  describe "edit spare_parts" do
    setup [:create_spare_parts]

    test "renders form for editing chosen spare_parts", %{conn: conn, spare_parts: spare_parts} do
      conn = get(conn, Routes.spare_parts_path(conn, :edit, spare_parts))
      assert html_response(conn, 200) =~ "Edit Spare parts"
    end
  end

  describe "update spare_parts" do
    setup [:create_spare_parts]

    test "redirects when data is valid", %{conn: conn, spare_parts: spare_parts} do
      conn =
        put(conn, Routes.spare_parts_path(conn, :update, spare_parts), spare_parts: @update_attrs)

      assert redirected_to(conn) == Routes.spare_parts_path(conn, :show, spare_parts)

      conn = get(conn, Routes.spare_parts_path(conn, :show, spare_parts))
      assert html_response(conn, 200) =~ "some updated device"
    end

    test "renders errors when data is invalid", %{conn: conn, spare_parts: spare_parts} do
      conn =
        put(conn, Routes.spare_parts_path(conn, :update, spare_parts), spare_parts: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Spare parts"
    end
  end

  describe "delete spare_parts" do
    setup [:create_spare_parts]

    test "deletes chosen spare_parts", %{conn: conn, spare_parts: spare_parts} do
      conn = delete(conn, Routes.spare_parts_path(conn, :delete, spare_parts))
      assert redirected_to(conn) == Routes.spare_parts_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, Routes.spare_parts_path(conn, :show, spare_parts))
      end)
    end
  end

  defp create_spare_parts(_) do
    spare_parts = spare_parts_fixture()
    %{spare_parts: spare_parts}
  end
end
