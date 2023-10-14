extends Collectible
## Script that lets you choose which fruit to display from the inspector.
## 
## Exposes a toggle to randomize and a dropdown if you'd rather specify.


## Should this fruit use a random animation? (Default is true)
@export var pick_random_fruit := true

## Which fruit animation should display (if randomize is unchecked?)
@export_enum("apple","banana", "cherry", "kiwi", "melon", "orange", "pineapple", "strawberry")
var fruit: String

@onready var animated_sprite_2d = $AnimatedSprite2D as AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var fruits = animated_sprite_2d.sprite_frames.get_animation_names()
	if pick_random_fruit:
		var f = randi_range(0, fruits.size() - 1)
		animated_sprite_2d.play(fruits[f])
	
	animated_sprite_2d.play(fruit)
