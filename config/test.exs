import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.

config :liink, Liink.Repo,
  password: "postgres",
  username: "postgres",
  hostname: System.get_env("DATABASE_HOST", "localhost"),
  database: "hello_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :liink, LiinkWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "QHdwxL+IYWYTXtsgYC79GCuaLAEFLTnzZNEYYIslx6AdHRFWUaG9CHPT4ZRroVWC",
  server: false

# In test we don't send emails.
config :liink, Liink.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
