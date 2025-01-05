defmodule GoblinChessServer.TCPHandler do
  use ThousandIsland.Handler

  @impl ThousandIsland.Handler
  def handle_data(
        <<
          "MOVE_",
          position::binary-size(1),
          piece::binary-size(1),
          player::binary-size(1),
          matchId::binary-size(1), # ??? - no idea on the size here
        >> = data,
        socket,
        state
      ) do
    ThousandIsland.Socket.send(socket, data)
    GoblinChessServer.Database.store("MOVE_" %{position: position, piece: piece, player: player, matchId: matchId})
    # record move event for current match; their will be a database that will record each move and will allow the player
    # to replay their games if they wish too.

    IO.puts("MOVE_ position=#{position} piece=#{piece} player=#{player}")

    move
    |> validate()
    |> state() # returns either the new board state or the state of the game (winner / loser / draw)

    {:continue, state}
  end

  @impl ThousandIsland.Handler
  def handle_data(<<"STATE", game_state::binary-size(1)>> = data, socket, state) do
    ThousandIsland.Socket.send(socket, data)

    IO.puts("STATE = #{inspect(game_state)}")
    {:continue, state}
  end

  @impl ThousandIsland.Handler
  def handle_data(<<opt::binary-size(4), rest::binary>> = data, socket, state) do
    ThousandIsland.Socket.send(socket, data)

    IO.puts("UNSUPPORTED OPT opt=#{opt} rest=#{inspect(rest)}")
    {:continue, state}
  end
end
