defmodule Add.Repo do
  use Ecto.Repo,
    otp_app: :add,
    adapter: Ecto.Adapters.Postgres
end
