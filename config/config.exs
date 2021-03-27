# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gather,
  ecto_repos: [Gather.Repo]

# Configures the endpoint
config :gather, GatherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "c0Rq6A4fAD9pY/APHKWG6QW5Q4S/UnX4cJWEEir/skQ8RIllZVritslrf3XkdcjX",
  render_errors: [view: GatherWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Gather.PubSub,
  live_view: [signing_salt: "T2NDAICy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
