use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :api_try, ApiTry.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]],
  secret_key_base: "p/yWGwKriuHpTc7uSVc5vIq0ZYPOqcbAjccM888s1seio4drj05uVtccprpYJosd"

config :api_try, ApiTry.Router,
  session: [store: :cookie, key: "_your_app_key"]

# Watch static and templates for browser reloading.
config :api_try, ApiTry.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :api_try, ApiTry.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "yllaf",
  password: "asdf;lkj1",
  database: "api_try_dev",
  hostname: "localhost",
  pool_size: 10
