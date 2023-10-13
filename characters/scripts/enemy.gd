class_name Enemy
extends CharacterBody2D
## Base Enemy class for easy creation and management.

## General physics details
@export var speed := 200.0
@export var jump_velocity := -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
#	_handle_collisons()


## basic hit method to be overriden as needed
func hit() -> void:
	print("Enemy has been hit!")


## Handle regular collisions - which... isn't consistently working rn.
#func _handle_collisons() -> void:
#	for i in get_slide_collision_count():
#		var collider = get_slide_collision(i).get_collider()
#		if collider.name == "Player":
#			collider.hit()


func _on_hit_box_body_entered(body):
	# figure out what came in
	# determine how to respond
	prints("HITBOX encountered", body.name)
	if body.name == "Player":
		hit()


## Wandering method used for testing
func _wander() -> void:
	pass
