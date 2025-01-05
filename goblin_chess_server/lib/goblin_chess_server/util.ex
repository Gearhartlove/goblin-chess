defmodule GoblinChessServer.Util do
  @moduledoc """
  Utility functions for GoblinChessServer.
  """

  defmacro __using__(_opts) do
    quote do
      @type piece() :: GoblinChessServer.Types.piece()
    end
  end
end
