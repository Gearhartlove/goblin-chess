defmodule GoblinChessServer.Engine do

  def move(too, from, piece, player, board) do
    board.move(too, from)
    # {:capture, piece_position, board}
    # {:winner, player, board}
    # {:draw, board}
    nil
  end

  # TODO
  def valid?(:pawn, from, too, player, board) do 
    true
  end
  # TODO
  def valid?(:knight, from, too, player, board) do end
  # TODO
  def valid?(:rook, from, too, player, board) do end
  # TODO
  def valid?(:queen, from, too, player, board) do end
  # TODO
  def valid?(:king, from, too, player, board) do end
end
