extends Node

const HOST: String = "localhost"
const PORT: int = 4000
const RECONNECT_TIMEOUT: float = 3.0

@onready var _client = get_node("client")

func _ready() -> void:
	# connect signals
	_client.connected.connect(_handle_client_connected)
	_client.disconnected.connect(_handle_client_disconnected)
	_client.error.connect(_handle_client_error)
	_client.data.connect(_handle_client_data)

	# connect to host
	_client.connect_to_host(HOST, PORT)

func _handle_client_connected() -> void:
	print("Client connected to server.")

func _handle_client_data(data: PackedByteArray) -> void:
	print("Sending Client data. data = ", data.get_string_from_utf8())
	_client.send(data)

func _handle_client_disconnected() -> void:
	print("Client disconnected from server. Trying to reconnect.")
	_connect_after_timeout(RECONNECT_TIMEOUT)

func _handle_client_error() -> void:
	print("Client error. Trying to reconnect.")
	_connect_after_timeout(RECONNECT_TIMEOUT)
	
func _connect_after_timeout(timeout: float) -> void:
	wait(timeout)
	_client.connect_to_host(HOST, PORT)
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

