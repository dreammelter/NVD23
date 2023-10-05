class_name Block
extends Area2D
## Block units for spawning.

# the animations in the collection display in ABC order in the editor
# but may not be stored as such in memory
enum Colors { RED, BLUE, GREEN, ORANGE, WHITE }

# The int value for these should match the animation frame
enum Face { FLAT, BOLT, BRICK }

@export var block_color: Colors = Colors.RED
@export var block_style: Face = Face.FLAT

@onready var block_collection = $BlockCollection as AnimatedSprite2D

# prepare the block before it enters the scene tree
func _init():
	pass

# Node is entering scene tree for the first time: set it up
func _ready():
	match block_color:
		Colors.RED:
			block_collection.set_animation("red")
		Colors.BLUE:
			block_collection.set_animation("blue")
		Colors.GREEN:
			block_collection.set_animation("green")
		Colors.ORANGE:
			block_collection.set_animation("orange")
		Colors.WHITE:
			block_collection.set_animation("white")
	
	block_collection.set_frame_and_progress(block_style,0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
