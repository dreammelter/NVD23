class_name Paddle
extends Node2D
## Controls the Paddle by responding to mouse input (or the alternative keys)

## Is this an enemy's paddle?
@export var is_dangerous := false

@onready var path_follower = $PaddlePath/PathFollower as PathFollow2D
@onready var cannon_point = $PaddlePath/PathFollower/CannonPoint as Marker2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


## Capture Mouse Events
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		cannon_point.test_fire()
	
	if event is InputEventMouseMotion:
		var vph = get_viewport_rect().end.y
		var usuable_area = vph - 10
		var mouse_pos = remap(event.position.y, 0.0, usuable_area, 0.0, 1.0)
		path_follower.progress_ratio = mouse_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
