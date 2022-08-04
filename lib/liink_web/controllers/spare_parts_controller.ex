defmodule LiinkWeb.SparePartsController do
  use LiinkWeb, :controller

  alias Liink.Parts
  alias Liink.Parts.SpareParts

  def index(conn, _params) do
    parts = Parts.list_parts()
    render(conn, "index.html", parts: parts)
  end

  def new(conn, _params) do
    changeset = Parts.change_spare_parts(%SpareParts{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"spare_parts" => spare_parts_params}) do
    case Parts.create_spare_parts(spare_parts_params) do
      {:ok, spare_parts} ->
        conn
        |> put_flash(:info, "Spare parts created successfully.")
        |> redirect(to: Routes.spare_parts_path(conn, :show, spare_parts))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    spare_parts = Parts.get_spare_parts!(id)
    render(conn, "show.html", spare_parts: spare_parts)
  end

  def edit(conn, %{"id" => id}) do
    spare_parts = Parts.get_spare_parts!(id)
    changeset = Parts.change_spare_parts(spare_parts)
    render(conn, "edit.html", spare_parts: spare_parts, changeset: changeset)
  end

  def update(conn, %{"id" => id, "spare_parts" => spare_parts_params}) do
    spare_parts = Parts.get_spare_parts!(id)

    case Parts.update_spare_parts(spare_parts, spare_parts_params) do
      {:ok, spare_parts} ->
        conn
        |> put_flash(:info, "Spare parts updated successfully.")
        |> redirect(to: Routes.spare_parts_path(conn, :show, spare_parts))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", spare_parts: spare_parts, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    spare_parts = Parts.get_spare_parts!(id)
    {:ok, _spare_parts} = Parts.delete_spare_parts(spare_parts)

    conn
    |> put_flash(:info, "Spare parts deleted successfully.")
    |> redirect(to: Routes.spare_parts_path(conn, :index))
  end
end
