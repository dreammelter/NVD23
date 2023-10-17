extends State
## Base Move/run State for all enemies

# shorthands for type-checking and hints
@onready var o = (owner as Enemy)


## Enter the state (setup house)
func enter() -> void:
	if not o.can_move:
		fsm.change_state("Idle")
	
	anims.play("run")


func physics_update(delta) -> void:
	if not o.is_on_floor():
		fsm.change_state("Air")
	
	# pick a direction to move in and go
	var cointoss = randi_range(0,1)
	var dir = -1 if cointoss == 0 else cointoss
	o.velocity.x += o.speed * dir * delta


func on_wander_timer_timeout():
	# once the timer is up, stop moving
	fsm.change_state("idle")


func on_nearfield_body_entered(body):
	fsm.change_state("Attack")
