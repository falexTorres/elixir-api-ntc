# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api_try,
  ecto_repos: [ApiTry.Repo]

# Configures the endpoint
config :api_try, ApiTry.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "PfOODxt8WFD5p+PbRA4kK6g5qOtd6Ud0viiMB5RMkBCZadOZ412RFdcB3EblPqFh",
  debug_errors: false,
  render_errors: [view: ApiTry.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ApiTry.PubSub,
           adapter: Phoenix.PubSub.PG2]

# config for GuardianDB
config :guardian_db, GuardianDb,
  repo: ApiTry.Repo,
  sweep_interval: 120
  # schema_name: default is "guardian_tokens"

#%{
#    "crv" => "P-521",
#    "d" => "axDuTtGavPjnhlfnYAwkHa4qyfz2fdseppXEzmKpQyY0xd3bGpYLEF4ognDpRJm5IRaM31Id2NfEtDFw4iTbDSE",
#    "kty" => "EC",
#    "x" => "AL0H8OvP5NuboUoj8Pb3zpBcDyEJN907wMxrCy7H2062i3IRPF5NQ546jIJU3uQX5KN2QB_Cq6R_SUqyVZSNpIfC",
#    "y" => "ALdxLuo6oKLoQ-xLSkShv_TA0di97I9V92sg1MKFava5hKGST1EKiVQnZMrN3HO8LtLT78SNTgwJSQHAXIUaA-lV"
#  }
config :guardian, Guardian,
  allowed_algos: ["ES512"],
  verify_module: Guardian.JWT,
  issuer: "ApiTry",
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: %{
    "crv" => "P-521",
    "d" => "axDuTtGavPjnhlfnYAwkHa4qyfz2fdseppXEzmKpQyY0xd3bGpYLEF4ognDpRJm5IRaM31Id2NfEtDFw4iTbDSE",
    "kty" => "EC",
    "x" => "AL0H8OvP5NuboUoj8Pb3zpBcDyEJN907wMxrCy7H2062i3IRPF5NQ546jIJU3uQX5KN2QB_Cq6R_SUqyVZSNpIfC",
    "y" => "ALdxLuo6oKLoQ-xLSkShv_TA0di97I9V92sg1MKFava5hKGST1EKiVQnZMrN3HO8LtLT78SNTgwJSQHAXIUaA-lV"
  },
  serializer: ApiTry.GuardianSerializer,
  hooks: GuardianDb,
  permissions: %{
    user: [
      :write_user_data,
      :read_user_data
    ],
    service_admin: [
      :write_service_data,
      :read_service_data,
      :read_user_data
    ],
    system_admin: [
      :write_user_data,
      :read_user_data,
      :write_service_data,
      :read_service_data
    ]
  }

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
