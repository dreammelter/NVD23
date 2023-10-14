class_name State
extends Node
## Bare-bones State class for use in a (Node-based) Finite State Machine
##
## I'll link the resources referenced for creating this later.

# Finished signal for states that need to share that info
signal finished(next_state)

# Methods for transitioning

## Enter the state (setup house)
func enter() -> void:
	pass


## Exit the state (clean-up/reset)
func exit() -> void:
	pass


# Methods for handling common signals (like animation)
func on_animation_finished(anim_name) -> void:
	pass


# Methods for handling Godot's game loop functions

## Tasks you'd usually run in _process()
func update(delta) -> void:
	pass


## Node Physics Updates
func physics_update(delta) -> void:
	pass


## Input received by node (handle your _unhandled_input)
func handle_input(event) -> void:
	pass
