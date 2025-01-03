defmodule GoblinChessServer.TCPHandler do
  use ThousandIsland.Handler

  @impl ThousandIsland.Handler
  def handle_data(<<"MOVE", move::binary-size(1)>> = data, socket, state) do
    ThousandIsland.Socket.send(socket, data)
  
    IO.puts("move=#{inspect(move)}")
    {:continue, state}
  end

  @impl ThousandIsland.Handler
  def handle_data(<<opt::binary-size(4), rest::binary>> = data, socket, state) do
    ThousandIsland.Socket.send(socket, data)
  
    IO.puts("UNSUPPORTED OPT opt=#{opt}")
    {:continue, state}
  end
end

