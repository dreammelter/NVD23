extends State
## Base Air state for all enemites to handle gravity and such.

# shorthand for type-checking and hints
@onready var o = (owner as Enemy)


## Enter the state (setup house)
func enter() -> void:
	pass


## Exit the state (clean-up/reset)
func exit() -> void:
	pass


## Tasks you'd usually run in _process()
func update(delta) -> void:
	pass


## Node Physics Updates
func physics_update(delta) -> void:
	# Add gravity if it applies
	if not o.is_on_floor() and o.use_gravity:
		o.velocity.y += o.gravity * delta
	else:
		fsm.change_state("Idle")


func on_wander_timer_timeout():
	# once the timer is up, wander around in the move state
	fsm.change_state("Move")
