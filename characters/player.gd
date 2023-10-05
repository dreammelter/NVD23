class_name Player
extends CharacterBody2D
## Main class for controlling the player character.
## 
## Manages movement and related animations.

## Emitted when the animated sprite flips its horizontal direction
signal direction_changed(direction: float)

const SPEED := 200.0
const JUMP_VELOCITY := -400.0
const MAX_JUMP_COUNT: int = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

var _jump_count: int = 0

@onready var animated_sprite = $AnimatedSprite as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		# play falling animation
		if animated_sprite.animation == "dbl_jump" and not animated_sprite.is_playing():
			animated_sprite.play("fall")
	else:
		# reset jump count when we land on the ground
		_jump_count = 0

	# Handle Jumping.
	if Input.is_action_just_pressed("jump") and (_jump_count < MAX_JUMP_COUNT):
		velocity.y = JUMP_VELOCITY
		_jump_count += 1
		if _jump_count > 1:
			animated_sprite.play("dbl_jump")
		else:
			animated_sprite.play("jump")

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		_change_anim_direction(direction)
		animated_sprite.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("idle")

	move_and_slide()

## Flips the animated sprite and emits a signal when direction changes
func _change_anim_direction(direction: float) -> void:
	if direction > 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
	
	emit_signal("direction_changed", direction)
