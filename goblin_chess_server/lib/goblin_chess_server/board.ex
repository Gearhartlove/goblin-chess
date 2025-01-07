defmodule GoblinChessServer.Board do
  use GoblinChessServer.Util

  def new() do
    {pieces(), grid()}
    |> combine()
  end

  @spec at(term(), integer(), integer()) :: piece() | nil
  def at(board, x, y) do
    board
    |> Enum.at(y)
    |> Enum.at(x)
  end

  def move() do 
    
  end

  defp pieces() do
    [
      # black
      [:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook],
      [:pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [:pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn],
      [:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook]
      # white
    ]
  end

  defp grid() do
    for n <- 1..8, l <- ?a..?h do
      {n, <<l>>}
    end
    |> Enum.chunk_every(8)
    |> IO.inspect(label: "chunked")
  end

  defp combine({pieces, grid}) do
    for {row_pieces, row_grid} <- Enum.zip(pieces, grid) do
      for {piece, {n, l}} <- Enum.zip(row_pieces, row_grid) do
        {piece, n, l}
      end
    end
  end
end
