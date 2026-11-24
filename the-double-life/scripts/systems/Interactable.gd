extends Area2D

@export var prompt_text: String = "[E] Inspect"
@export var dialogue_text: String = "You examine the object."
@export var clue_id: String = ""
@export var return_to_map: bool = false

var _player_in_range: bool = false

signal interacted(prompt: String, dialogue: String, clue: String, go_map: bool)

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		_player_in_range = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		_player_in_range = false

func _unhandled_input(event: InputEvent) -> void:
	if _player_in_range and event.is_action_pressed("interact"):
		if clue_id != "":
			GameManager.collect_clue(clue_id)
		emit_signal("interacted", prompt_text, dialogue_text, clue_id, return_to_map)
