extends StateMachine
## FSM extended for use w/ Enemy class


func _on_time_to_wander_timeout():
	if current_state.has_method("on_wander_timer_timeout"):
		current_state.on_wander_timer_timeout()
	else:
		print("ENEMY: Nothing to handle wander timeout, moving on.")


func _on_enemy_was_hit():
	change_state("Hit")


func _on_nearfield_body_entered(body):
	pass # Replace with function body.
