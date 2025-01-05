extends Button

@onready var client = get_node("../handlers/client")

func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	print("sending MOVE 1")
	client.send(PackedByteArray([77, 79, 86, 69, 1]))
