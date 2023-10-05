class_name CannonPoint
extends Marker2D
## Marquee for spawning cannon balls; manages its own ammo.

@export var ammo: Array[Ball] = []
@export var max_size: int = 3

var BallScene = preload("res://components/block_breaker/ball.tscn")


## Testing function that doesn't consume ammo
func test_fire() -> void:
	var b = BallScene.instantiate()
	b.launch(global_position)
	get_tree().root.add_child(b) # this doesn't fly well outside of a level, i heard


## Unload the first ball in the array
## Instances it at this marker's global position
func fire() -> void:
	var b = ammo.pop_front()
	if b:
		print("CANNON: we've got firepower!")
		b.launch(global_position)
	else:
		print("CANNON: uh-oh - no ammo")


## Load a ball into the array
func reload(ball: Ball) -> void:
	if ammo.size() == max_size:
		return
	ammo.push_back(ball)
