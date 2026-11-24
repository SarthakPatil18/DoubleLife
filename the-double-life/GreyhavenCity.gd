
extends Node2D

@onready var player: CharacterBody2D = $World/YSort/Player
@onready var camera: Camera2D = $Camera2D2

func _ready() -> void:
	print("Welcome to Greyhaven.")
	print("Julian has entered the city.")
	print("Player spawn: ", player.global_position)
	print("Camera position: ", camera.global_position)
	print("Camera zoom: ", camera.zoom)

func _process(_delta: float) -> void:
	if Engine.get_process_frames() % 120 == 0:
		print("Player: ", player.global_position,
			" | Camera: ", camera.global_position)
