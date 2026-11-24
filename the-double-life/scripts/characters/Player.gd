
extends CharacterBody2D

@export var walk_speed: float = 150.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var last_direction: Vector2 = Vector2.DOWN


func _ready() -> void:
	if sprite == null:
		push_error("AnimatedSprite2D not found under Player!")
		return

	print("Julian's controller loaded.")


func _physics_process(_delta: float) -> void:
	if sprite == null:
		return

	var direction := Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = direction * walk_speed
	move_and_slide()

	update_animation(direction)


func update_animation(direction: Vector2) -> void:

	if direction == Vector2.ZERO:
		sprite.flip_v = false

		if last_direction.y < 0:
			sprite.flip_h = false
			play_animation("idle_up")
		elif last_direction.y > 0:
			sprite.flip_h = false
			play_animation("idle_down")
		else:
			play_animation("idle_side")

		return

	last_direction = direction

	# LEFT / RIGHT
	if abs(direction.x) > abs(direction.y):
		sprite.flip_v = false
		sprite.flip_h = direction.x < 0
		play_animation("walk_side")

	# UP
	elif direction.y < 0:
		sprite.flip_h = false
		sprite.flip_v = false
		play_animation("walk_up")

	# DOWN - temporary flipped animation
	else:
		sprite.flip_h = false
		sprite.flip_v = true
		play_animation("walk_up")


func play_animation(animation_name: String) -> void:
	if not sprite.sprite_frames.has_animation(animation_name):
		push_warning("Missing animation: " + animation_name)
		return

	if sprite.animation != animation_name:
		sprite.play(animation_name)
