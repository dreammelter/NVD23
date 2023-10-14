class_name StateMachine
extends Node
## Bare-bones State Machine for all your state-juggling needs.
## 
## Node-based. Obviously. I'll add referenced sources later.


## Emit when moving to a new state
signal state_changed(state_name)

## Path to a State for the machine to start with
@export var initial_state: NodePath

@onready var current_state = get_node(initial_state)


# Setup the State Machine
func _ready() -> void:
	if current_state == null:
		push_warning("hey-- you don't have a state")
	# wait until parent node is ready
	current_state.enter


# Game loop hooks to delegate

func _process(delta) -> void:
	current_state.update(delta)


func _physics_process(delta) -> void:
	current_state.physics_update(delta)


func _unhandled_input(event) -> void:
	current_state.handle_input(event)


# Signals and such to pass on
func _on_animation_finished(anim) -> void:
	current_state.on_animation_finished(anim)


# State Management functions
## Initialize the machine and first state
func initialize() -> void:
	pass

## Transition to a new state
func change_state(state_name: String) -> void:
	## verify the state exists first
	if not has_node(state_name):
		return
	
	current_state.exit()
	current_state = get_node(state_name)
	current_state.enter()
	state_changed.emit(current_state.name)
