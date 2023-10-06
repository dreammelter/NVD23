class_name CursorRing
extends Node2D
## Directional Indicator that follows the mouse
## 
## May be a temporary stop gap since UI should be done using Control nodes

@onready var cursor = $Cursor as Sprite2D
@onready var cannon_point = $Cursor/CannonPoint as Marker2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


## Capture Mouse Events
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		cannon_point.test_fire()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cursor.look_at(get_global_mouse_position())
	# pink arrow points to the mouse. could do PI /2 to rotate but meh
