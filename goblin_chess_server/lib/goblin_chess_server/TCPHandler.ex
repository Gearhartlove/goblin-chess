defmodule GoblinChessServer.TCPHandler do
  use ThousandIsland.Handler

  @impl ThousandIsland.Handler
  def handle_data(
        <<
          "PICKUP",
          position::binary-size(1),
          piece::binary-size(1),
          player::binary-size(1),
          # ??? - no idea on the size here
          matchId::binary-size(1)
        >>,
        socket,
        state
      ) do
    {:continue, state}
  end

  # checkmate (win the game), put a king in check, promote a piece, take another piece
  @impl ThousandIsland.Handler
  def handle_data(
        <<
          "MOVE",
          from::binary-size(1),
          too::binary-size(1),
          piece::binary-size(1),
          player::binary-size(1),
          # ??? - no idea on the size here
          matchId::binary-size(1)
        >> = data,
        socket,
        state
      ) do
    # IO.puts("MOVE_ position=#{position} piece=#{piece} player=#{player}")
    # TODO
    # case GoblinChessServer.Engine.valid?(piece, from, too, player, state[:board]) do
    #       false ->
    #         ThousandIsland.Socket.send(socket, {:nak, :invalid_move})
    #         {:continue, state}
    # 
    #       true ->
    #         case GoblinChessServer.Engine.move() do 
    #         end
    # 
    #         ThousandIsland.Socket.send(socket, :ack)
    #         # TODO
    #         GoblinChessServer.Database.store(
    #           "MOVE_",
    #           %{position: position, piece: piece, player: player, matchId: matchId}
    #         )
    # 
    #         {:continue, Keyword.replace(state, :board, updated_board)}
    #     end
    # 
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
