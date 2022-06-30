defmodule Liink.Repo do
  use Ecto.Repo,
    otp_app: :liink,
    adapter: Ecto.Adapters.Postgres
end
