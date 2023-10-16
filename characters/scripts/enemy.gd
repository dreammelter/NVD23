class_name Enemy
extends CharacterBody2D
## Base Enemy class for easy creation and management.


## Juice bar (which doubles as health)
@export var juice: int = 0

## How much damage the enemy deal?
@export var damage_dealt: int = 10

# General physics details
@export var speed := 200.0
@export var jump_velocity := -400.0

## Turn this off for enemies that float.
@export var use_gravity := true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and use_gravity:
		velocity.y += gravity * delta

	move_and_slide()
#	_handle_collisons()


## Basic hit method to be overriden as needed
## Return value indicates if stat is at zero
func hit(amount: int) -> bool:
	print("Enemy has been hit!")
	juice -= amount
	if juice < 0:
		juice = 0
		return true
	return false


## Adjust Juice bar when collecting fruit (or using booster)
## Return value indicates if stat is maxed
func charge(amount: int) -> bool:
	juice += amount
	if juice > 100:
		juice = 100
		return true
	return false


## Handle regular collisions - which... isn't consistently working rn.
#func _handle_collisons() -> void:
#	for i in get_slide_collision_count():
#		var collider = get_slide_collision(i).get_collider()
#		if collider.name == "Player":
#			collider.hit()


## Currently misused to deal damage to the player... for testing.
func _on_hit_box_body_entered(body):
	# figure out what came in
	# determine how to respond
	prints("HITBOX encountered", body.name)
	if body.name == "Player":
		hit(damage_dealt)


## Wandering method used for testing
func _wander() -> void:
	pass
