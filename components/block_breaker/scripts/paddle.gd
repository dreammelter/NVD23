class_name Paddle
extends Node2D
## Controls the Paddle by responding to mouse input (or the alternative keys)

## Is this an enemy's paddle?
@export var is_dangerous := false

@onready var path_follower = $PaddlePath/PathFollower as PathFollow2D
@onready var paddle_bar = $PaddlePath/PathFollower/PaddleBar as StaticBody2D
@onready var cannon_point = $PaddlePath/PathFollower/CannonPoint as CannonPoint


# Called when the node enters the scene tree for the first time.
func _ready():
	if is_dangerous:
		paddle_bar.use_enemy_color()


## Capture Mouse Events
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		cannon_point.test_fire()
	
	if event is InputEventMouseMotion:
		_control_as_arc(event.position.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


## Original (unwieldy) control scheme [break]
## Turns looping off the path follower and uses mouse y axis to slide it along the path.
## y_pos is the mouse's y position;
func _control_as_arc(y_pos: float) -> void:
	path_follower.loop = false
	var vph = get_viewport_rect().end.y
#	var usable_area = vph - 10 # doesn't help w/ the top of the screen...
	var mouse_pos = remap(y_pos, 0.0, vph, 0.0, 1.0)
	path_follower.progress_ratio = mouse_pos
