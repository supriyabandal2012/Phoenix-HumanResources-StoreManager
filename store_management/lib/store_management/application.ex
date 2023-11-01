defmodule StoreManagement.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      StoreManagementWeb.Telemetry,
      # Start the Ecto repository
      StoreManagement.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: StoreManagement.PubSub},
      # Start Finch
      {Finch, name: StoreManagement.Finch},
      # Start the Endpoint (http/https)
      StoreManagementWeb.Endpoint
      # Start a worker by calling: StoreManagement.Worker.start_link(arg)
      # {StoreManagement.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StoreManagement.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StoreManagementWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
