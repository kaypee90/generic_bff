use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :my_bff, MyBff.Endpoint,
  secret_key_base: "F2wAwhiKEyggeGocVhZ3PiQDxTOOTnRTlTu33KNsR93CKuGqFgFC8JUyTiETHN4E"

# Configure your database
config :my_bff, MyBff.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "my_bff_prod",
  pool_size: 20
