# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :api_keys_ex,
  ecto_repos: [ApiKeysEx.Repo]

# Configures the endpoint
config :api_keys_ex, ApiKeysExWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ApiKeysExWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ApiKeysEx.PubSub,
  live_view: [signing_salt: "vq5o695I"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
