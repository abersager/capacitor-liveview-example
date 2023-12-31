defmodule CapacitorLiveview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CapacitorLiveviewWeb.Telemetry,
      # Start the Ecto repository
      CapacitorLiveview.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CapacitorLiveview.PubSub},
      # Start Finch
      {Finch, name: CapacitorLiveview.Finch},
      # {NodeJS, path: "/src/js", pool_size: 4},
      %{
        id: NodeJS,
        start: {NodeJS, :start_link, [[path: "/src/js", pool_size: 4]]}
      },
      # Start the Endpoint (http/https)
      CapacitorLiveviewWeb.Endpoint
      # Start a worker by calling: CapacitorLiveview.Worker.start_link(arg)
      # {CapacitorLiveview.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CapacitorLiveview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CapacitorLiveviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
