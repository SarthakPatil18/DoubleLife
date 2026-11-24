
extends CharacterBody2D

@export var speed: float = 150.0

@onready var sprite: AnimatedSprite2D = get_node_or_null("AnimatedSprite2D")

var last_direction: Vector2 = Vector2.DOWN


func _ready() -> void:
	if sprite == null:
		push_error("AnimatedSprite2D not found! Check the Player scene tree.")
	else:
		print("Julian's sprite loaded successfully.")


func _physics_process(_delta: float) -> void:
	if sprite == null:
		return

	var direction: Vector2 = Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)

	velocity = direction * speed
	move_and_slide()

	update_animation(direction)


func update_animation(direction: Vector2) -> void:

	# IDLE ANIMATIONS
	if direction == Vector2.ZERO:

		if last_direction.y < 0:
			play_animation("idle_up")

		elif last_direction.y > 0:
			play_animation("idle_down")

		else:
			play_animation("idle")

		return

	# Remember the latest movement direction
	last_direction = direction

	# LEFT / RIGHT MOVEMENT
	if abs(direction.x) > abs(direction.y):

		sprite.flip_h = direction.x < 0
		play_animation("walk_side")

	# UP MOVEMENT
	elif direction.y < 0:

		sprite.flip_h = false
		play_animation("walk_up")

	# DOWN MOVEMENT
	else:

		sprite.flip_h = false
		play_animation("walk_down")


func play_animation(animation_name: String) -> void:

	if sprite.sprite_frames.has_animation(animation_name):
		if sprite.animation != animation_name:
			sprite.play(animation_name)

	else:
		# Fallback if an animation has not been created yet
		if sprite.sprite_frames.has_animation("idle"):
			sprite.play("idle")
