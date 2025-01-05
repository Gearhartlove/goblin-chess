extends Node

signal connected
signal data
signal disconnected
signal error

var _status: int
var _stream: StreamPeerTCP

func _ready() -> void:
	_stream = StreamPeerTCP.new()
	_status = _stream.get_status()

func _process(_delta: float) -> void:
	_stream.poll() # poll the socket to update it's state
	var new_status: int = _stream.get_status()
	if new_status != _status: # diff the two statuses, emit signal on diff
		_status = new_status
		match _status:
			_stream.STATUS_NONE:
				print("Disconnected from host.")
				emit_signal("disconnected")
			_stream.STATUS_CONNECTING:
				print("Connecting to host.")
			_stream.STATUS_CONNECTED:
				print("Connected to host.")
				emit_signal("connected")
			_stream.STATUS_ERROR:
				print("Error with socket stream.")
				emit_signal("error")

	if _status == _stream.STATUS_CONNECTED:
		var available_bytes: int = _stream.get_available_bytes()
		if available_bytes > 0:
			print("available bytes: ", available_bytes)
			var partial_data: Array = _stream.get_partial_data(available_bytes)
			# Check for read error.
			if partial_data[0] != OK:
				print("Error getting data from stream: ", partial_data[0])
				emit_signal("error")
			else:
				emit_signal("data", partial_data[1])

func connect_to_host(host: String, port: int) -> void:
	print("Connecting to %s:%d" % [host, port])
	_stream.connect_to_host(host, port)

func send(bytes: PackedByteArray) -> bool:
	if _status != _stream.STATUS_CONNECTED:
		return false
	var stream_error: int = _stream.put_data(bytes)
	if stream_error != OK:
		print("Error writing to stream: ", error)
		return false
	return true

