defmodule GoblinChessServer.Board do
  # import GoblinChessServer.Util, only: [piece: 0]

  def grid() do 
    for n <- 1..8, l <- ?a..?h do
      {n, <<l>>}
    end
    |> Enum.chunk_every(8)
    |> IO.inspect(label: "chunked")
  end

  @spec at(GoblinChessServer.Util.piece()):: GoblinChessServer.Util.piece() | nil
  def at(board) do 
  end
end

# grid = GoblinChessServer.Board.grid()
# IO.inspect(grid)
# 
# grid
# |> Enum.chunk_every(8)
# |> IO.inspect(label: "chunked")
