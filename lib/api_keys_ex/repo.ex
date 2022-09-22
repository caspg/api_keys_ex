defmodule ApiKeysEx.Repo do
  use Ecto.Repo,
    otp_app: :api_keys_ex,
    adapter: Ecto.Adapters.Postgres
end
