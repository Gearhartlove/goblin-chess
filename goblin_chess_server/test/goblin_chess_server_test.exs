defmodule GoblinChessServerTest do
  use ExUnit.Case

  test "handle_connection/1 processes incoming data correctly" do
    # Mock socket or connection data
    socket = ""
    data = ""
    state = ""

    # Call the handle_connection function
    assert GoblinChessServer.TCPHandler.handle_data(socket, data, state) == {:continue, state}
  end
end
