extends Control

@onready var police_btn: Button = $PoliceBtn
@onready var crime_scene_btn: Button = $CrimeSceneBtn
@onready var warehouse_btn: Button = $WarehouseBtn
@onready var info_label: Label = $InfoBar/HBox/InfoLabel
@onready var enter_btn: Button = $InfoBar/HBox/EnterBtn

var _selected_scene: String = ""

func _ready() -> void:
	police_btn.pressed.connect(func(): _select("Police Department (Day)", "Your official workplace. Review Case 01 and talk to colleagues.", "res://scenes/levels/PoliceDepartment.tscn", true))
	crime_scene_btn.pressed.connect(func(): _select("Crime Scene Alley (Day)", "Inspect the scene for physical evidence.", "res://scenes/levels/CrimeScene.tscn", true))

	var warehouse_unlocked := GameManager.deduced_leads.has("night_warehouse")
	if warehouse_unlocked:
		warehouse_btn.text = "Warehouse (Night)"
	else:
		warehouse_btn.text = "Warehouse [LOCKED]"

	warehouse_btn.pressed.connect(func():
		if warehouse_unlocked:
			_select("Greyhaven Mfg. Warehouse (Night)", "Restricted area. Avoid guards and find hidden records.", "res://scenes/levels/Warehouse.tscn", true)
		else:
			_select("Greyhaven Mfg. Warehouse [LOCKED]", "Connect daytime clues in your Journal (J) to unlock this night lead.", "", false)
	)

	enter_btn.pressed.connect(_on_enter_pressed)

func _select(title: String, desc: String, scene_path: String, available: bool) -> void:
	info_label.text = "  " + title + " — " + desc
	_selected_scene = scene_path
	enter_btn.disabled = not available

func _on_enter_pressed() -> void:
	if _selected_scene != "" and ResourceLoader.exists(_selected_scene):
		get_tree().change_scene_to_file(_selected_scene)
	else:
		push_warning("Level scene not built yet: " + _selected_scene)
