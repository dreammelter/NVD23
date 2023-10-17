extends State
## Base Idle State for all enemies

# shorthands for type-checking and hints
@onready var o = (owner as Enemy)


## Enter the state (setup house)
func enter() -> void:
	# stop moving first
#	o.velocity.x = move_toward(o.velocity.x, 0, o.speed)
	o.velocity = Vector2.ZERO
	# play idle animation
	anims.play("idle")


func physics_update(delta) -> void:
	# if jumping or falling use the air state
	if not o.is_on_floor():
		fsm.change_state("Air")


func on_wander_timer_timeout():
	# once the timer is up, wander around in the move state
	fsm.change_state("Move")


func on_nearfield_body_entered(body):
	fsm.change_state("Attack")
