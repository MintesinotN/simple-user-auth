import Config

if config_env() == :prod do
  config :simple_user_auth, SimpleUserAuthWeb.Endpoint, server: true

  database_url = "ecto://user:pass@host/database"
  secret_key_base = "your_hardcoded_very_long_secret_key"
  host = "your-app.onrender.com"
  port = String.to_integer(System.get_env("PORT") || "4000")

  config :simple_user_auth, SimpleUserAuth.Repo,
    url: database_url,
    pool_size: 10

  config :simple_user_auth, SimpleUserAuthWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: port
    ],
    server: true,
    secret_key_base: secret_key_base
end
