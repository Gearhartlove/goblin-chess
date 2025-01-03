defmodule GoblinChessServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {ThousandIsland, port: 4000, handler_module: GoblinChessServer.TCPHandler}
      # Starts a worker by calling: GoblinChessServer.Worker.start_link(arg)
      # {GoblinChessServer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GoblinChessServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
