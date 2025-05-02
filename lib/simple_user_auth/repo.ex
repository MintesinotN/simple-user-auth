defmodule SimpleUserAuth.Repo do
  use Ecto.Repo,
    otp_app: :simple_user_auth,
    adapter: Ecto.Adapters.Postgres
end
