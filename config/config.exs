# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :arteesan,
  ecto_repos: [Arteesan.Repo]

# Configures the endpoint
config :arteesan, Arteesan.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "641VCp4Ihqx/FsQLndp0pvl+m9kowJZeBcSq6Rt1LOfUd+qBbSFIaMm48iF5xclr",
  render_errors: [view: Arteesan.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Arteesan.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "", #System.get_env("GITHUB_CLIENT_ID"),
  client_secret: "" #System.get_env("GITHUB_CLIENT_SECRET")
