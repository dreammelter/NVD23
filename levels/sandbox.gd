extends Node2D

@export var testing: Resource

var coins_collected: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


## Listen for when the player collects coins or fruit
func _on_player_item_collected(item_type):
	if item_type == "coin":
		coins_collected += 1
	print("SANDBOX: coins ",coins_collected)
