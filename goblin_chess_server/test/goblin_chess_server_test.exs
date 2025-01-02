defmodule GoblinChessServerTest do
  use ExUnit.Case
  doctest GoblinChessServer

  test "greets the world" do
    assert GoblinChessServer.hello() == :world
  end
end
