# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures compilable leex for template
config :phoenix, :template_engines,
  leex: Phoenix.LiveView.Engine

# Configures the endpoint
config :lv_sample, LvSampleWeb.Endpoint,
  live_view: [signing_salt: "8KCb+5yr6mipU6A9UMSO/Wi1r2gnnsqV"],
  url: [host: "localhost"],
  secret_key_base: "f8N5jtH0ij7LI0VsQb4OkkR9FuPxDAw9nij4nMrNK2261ZF0wSerJCMQ86/fKxX7",
  render_errors: [view: LvSampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LvSample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
