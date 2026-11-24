extends Control

@export var game_start_scene: String = "res://greyhaven_city.tscn"

@onready var new_game_btn: Button = $CenterContainer/VBoxContainer/NewGameBtn
@onready var settings_btn: Button = $CenterContainer/VBoxContainer/SettingsBtn
@onready var quit_btn: Button = $CenterContainer/VBoxContainer/QuitBtn
@onready var settings_panel: PanelContainer = $SettingsPanel
@onready var fullscreen_check: CheckButton = $SettingsPanel/VBox/FullscreenCheck
@onready var close_settings_btn: Button = $SettingsPanel/VBox/CloseSettingsBtn

func _ready() -> void:
	new_game_btn.pressed.connect(_on_new_game)
	settings_btn.pressed.connect(func(): settings_panel.visible = true)
	quit_btn.pressed.connect(func(): get_tree().quit())
	close_settings_btn.pressed.connect(func(): settings_panel.visible = false)
	fullscreen_check.toggled.connect(_on_fullscreen_toggled)
	fullscreen_check.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN

func _on_new_game() -> void:
	if ResourceLoader.exists(game_start_scene):
		get_tree().change_scene_to_file(game_start_scene)
	else:
		push_warning("Next scene not found yet: " + game_start_scene)

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
