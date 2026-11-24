
extends Control

@export var next_scene_path: String = "res://scenes/ui/MainMenu.tscn"

@onready var narration_label: Label = $CenterContainer/VBoxContainer/NarrationLabel
@onready var continue_label: Label = $CenterContainer/VBoxContainer/ContinueLabel
@onready var narration_player: AudioStreamPlayer2D = $NarrationPlayer


var _lines: Array[String] = [
	"Every city has secrets.",
	"Some are buried in the streets. Others hide behind the people we trust.",
	"By day, Julian Vance investigates the truth.",
	"By night, he searches for answers that the system refuses to find.",
	"But every secret leaves a trace."
]

var _line_times: Array[float] = [
	0.0,
	3.0,
	7.0,
	11.0,
	17.0
]

var _current_line: int = -1
var _ready_to_continue: bool = false
var _skipped: bool = false


func _ready() -> void:
	narration_label.modulate.a = 0.0
	continue_label.modulate.a = 0.0

	var fade := create_tween()
	fade.tween_property(self, "modulate:a", 1.0, 1.2)
	fade.tween_callback(_start_narration)


func _start_narration() -> void:
	if narration_player.stream == null:
		push_error("No narration MP3 assigned!")
		return

	narration_player.play()


func _process(_delta: float) -> void:
	if not narration_player.playing or _skipped:
		return

	var playback_time := narration_player.get_playback_position()

	for i in range(_line_times.size()):
		if playback_time >= _line_times[i] and _current_line < i:
			_current_line = i
			_show_line(i)


func _show_line(index: int) -> void:
	narration_label.modulate.a = 0.0
	narration_label.text = _lines[index]

	var fade := create_tween()
	fade.tween_property(narration_label, "modulate:a", 1.0, 0.35)


func _on_narration_player_finished() -> void:
	if _skipped:
		return

	_ready_to_continue = true

	var fade := create_tween()
	fade.tween_property(continue_label, "modulate:a", 1.0, 0.8)


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if _ready_to_continue:
			_go_next()
		elif not _skipped:
			_skip_narration()


func _skip_narration() -> void:
	_skipped = true
	narration_player.stop()

	_current_line = _lines.size() - 1
	narration_label.text = _lines[-1]
	narration_label.modulate.a = 1.0

	_ready_to_continue = true
	continue_label.modulate.a = 1.0


func _go_next() -> void:
	if ResourceLoader.exists(next_scene_path):
		get_tree().change_scene_to_file(next_scene_path)
	else:
		push_warning("Next scene not found: " + next_scene_path)
