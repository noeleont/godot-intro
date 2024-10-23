extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -200.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.animation = "run"
		if direction == -1 and not animated_sprite.flip_h:
			animated_sprite.flip_h = true
		elif direction == 1 and animated_sprite.flip_h:
			animated_sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x == 0:
		animated_sprite.animation = "idle"

	move_and_slide()
