defmodule Liink.Parts do
  @moduledoc """
  The Parts context.
  """

  import Ecto.Query, warn: false
  alias Liink.Repo

  alias Liink.Parts.SpareParts

  @doc """
  Returns the list of parts.

  ## Examples

      iex> list_parts()
      [%SpareParts{}, ...]

  """
  def list_parts() do
    SpareParts
    |> Repo.all()
  end

  def list_parts(params) do
    search_term = get_in(params, ["query"])

    SpareParts
    |> SpareParts.search(search_term)
    |> Repo.all()
  end

  @doc """
  Gets a single spare_parts.

  Raises `Ecto.NoResultsError` if the Spare parts does not exist.

  ## Examples

      iex> get_spare_parts!(123)
      %SpareParts{}

      iex> get_spare_parts!(456)
      ** (Ecto.NoResultsError)

  """
  def get_spare_parts!(id), do: Repo.get!(SpareParts, id)

  @doc """
  Creates a spare_parts.

  ## Examples

      iex> create_spare_parts(%{field: value})
      {:ok, %SpareParts{}}

      iex> create_spare_parts(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_spare_parts(attrs \\ %{}) do
    %SpareParts{}
    |> SpareParts.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a spare_parts.

  ## Examples

      iex> update_spare_parts(spare_parts, %{field: new_value})
      {:ok, %SpareParts{}}

      iex> update_spare_parts(spare_parts, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_spare_parts(%SpareParts{} = spare_parts, attrs) do
    spare_parts
    |> SpareParts.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a spare_parts.

  ## Examples

      iex> delete_spare_parts(spare_parts)
      {:ok, %SpareParts{}}

      iex> delete_spare_parts(spare_parts)
      {:error, %Ecto.Changeset{}}

  """
  def delete_spare_parts(%SpareParts{} = spare_parts) do
    Repo.delete(spare_parts)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking spare_parts changes.

  ## Examples

      iex> change_spare_parts(spare_parts)
      %Ecto.Changeset{data: %SpareParts{}}

  """
  def change_spare_parts(%SpareParts{} = spare_parts, attrs \\ %{}) do
    SpareParts.changeset(spare_parts, attrs)
  end
end
