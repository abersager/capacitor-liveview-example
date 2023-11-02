defmodule CapacitorLiveview.Repo do
  use Ecto.Repo,
    otp_app: :capacitor_liveview,
    adapter: Ecto.Adapters.Postgres
end
