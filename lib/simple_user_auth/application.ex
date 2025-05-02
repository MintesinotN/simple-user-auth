defmodule SimpleUserAuth.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SimpleUserAuthWeb.Telemetry,
      SimpleUserAuth.Repo,
      {DNSCluster, query: Application.get_env(:simple_user_auth, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SimpleUserAuth.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SimpleUserAuth.Finch},
      # Start a worker by calling: SimpleUserAuth.Worker.start_link(arg)
      # {SimpleUserAuth.Worker, arg},
      # Start to serve requests, typically the last entry
      SimpleUserAuthWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleUserAuth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SimpleUserAuthWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
