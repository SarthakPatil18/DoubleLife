extends Control

@export var next_scene_path: String = "res://scenes/ui/OpeningIntro.tscn"
@export var load_duration: float = 2.5
@export var total_segments: int = 25

@onready var bar_frame: PanelContainer = $CenterContainer/VBoxContainer/BarFrame
@onready var segments_box: HBoxContainer = $CenterContainer/VBoxContainer/BarFrame/Segments
@onready var percent_label: Label = $CenterContainer/VBoxContainer/PercentLabel

var _elapsed: float = 0.0
var _blocks: Array[ColorRect] = []

func _ready() -> void:
	# Crisp white pixel border around the segmented bar
	var frame_style := StyleBoxFlat.new()
	frame_style.bg_color = Color(0, 0, 0, 1)
	frame_style.border_color = Color(1, 1, 1, 1)
	frame_style.set_border_width_all(3)
	frame_style.set_content_margin_all(4)
	bar_frame.add_theme_stylebox_override("panel", frame_style)

	# Create 25 segmented pixel blocks
	for i in range(total_segments):
		var block := ColorRect.new()
		block.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		block.color = Color(1, 1, 1, 0) # Hidden until filled
		segments_box.add_child(block)
		_blocks.append(block)

func _process(delta: float) -> void:
	_elapsed += delta
	var progress := clampf(_elapsed / load_duration, 0.0, 1.0)
	var percent := int(progress * 100.0)
	percent_label.text = str(percent) + "%"

	var filled_count := int(progress * total_segments)
	for i in range(total_segments):
		_blocks[i].color.a = 1.0 if i < filled_count else 0.0

	if progress >= 1.0:
		set_process(false)
		if ResourceLoader.exists(next_scene_path):
			get_tree().change_scene_to_file(next_scene_path)
		else:
			push_warning("Next scene not found yet: " + next_scene_path)
