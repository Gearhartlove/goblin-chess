extends Node

signal move

func _ready():
	pass

func move(piece, position, player):
	print(
		"Player moved a piece. player = %s piece = %s position = %s" % 
		[player, piece, position]
	)
	move.emit(piece, position, player)

# game that listens to me the player
# 	responsibilities: when a player moves a piece, make note of it, validate possible moves, determine winner, start game, restart game, pause game, clock
# controller code that takes what the player wants and passes it to the client
# 	responsibilities: absorb game signals and send them to the client, make decisions based off of the response
# client talks to elixir
#		responsibilities: send binary messages to elixir client

