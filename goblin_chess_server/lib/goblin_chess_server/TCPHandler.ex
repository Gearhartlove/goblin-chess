defmodule GoblinChessServer.TCPHandler do
  use ThousandIsland.Handler

  @impl ThousandIsland.Handler
  def handle_data(<<first, rest::binary>> = data, socket, state) do
    ThousandIsland.Socket.send(socket, data)
  
    IO.puts("first=#{inspect(first)} rest=#{inspect(rest)}")
    {:continue, state}
  end


  @impl ThousandIsland.Handler
  def handle_data(data, socket, state) do
    ThousandIsland.Socket.send(socket, data)
    IO.puts("data=#{inspect(data)} socket=#{inspect(socket)} state=#{inspect(state)}")
    {:continue, state}
  end
end

