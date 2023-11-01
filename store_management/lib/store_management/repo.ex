defmodule StoreManagement.Repo do
  use Ecto.Repo,
    otp_app: :store_management,
    adapter: Ecto.Adapters.Postgres
end
