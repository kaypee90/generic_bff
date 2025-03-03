# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_bff,
  ecto_repos: [MyBff.Repo]

# Configures the endpoint
config :my_bff, MyBff.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bJ0jrHJYrGOXHafTzmm/2ZHiF2UUm8pjKRcbfyvvF8Whkg81X6OKcn8YPurzeFl7",
  render_errors: [view: MyBff.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyBff.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
