defmodule GoblinChessServer.Board do
  use GoblinChessServer.Util

  def grid() do 
    for n <- 1..8, l <- ?a..?h do
      {n, <<l>>}
    end
    |> Enum.chunk_every(8)
    |> IO.inspect(label: "chunked")
  end

  @spec at(term(), integer(), integer()):: piece() | nil
  def at(board, x, y) do 
    board 
    |> Enum.at(y)
    |> Enum.at(x)
  end
end
