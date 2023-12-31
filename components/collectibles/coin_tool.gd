@tool
class_name CoinPath
extends Path2D
## Tool to make adding groups of coins easier
##
## Currently just spawns an amount along the path


const COIN_VALUES = {
	0: 10,
	1: 5
}

@export_enum("Gold:0","Silver:1") var coin_style: int

## How many coins should be on this path? Default is 3
@export_range(2,50) var count: int = 3

var coin = preload("res://components/collectibles/coin.tscn")

@onready var coin_spawner = $CoinSpawner as PathFollow2D


func _process(delta):
# unhide this if you want (broken) editor previews.
#	if Engine.is_editor_hint():		
#		_spawn_coins()
	pass

# Spawn the coins!
func _ready():
	_spawn_coins()


## Spawning function
func _spawn_coins() -> void:
	var animation = "silver" if coin_style == 1 else "gold"
	
	for i in (count):
		var c = coin.instantiate()
		coin_spawner.progress_ratio = float(i) / float(count-1)
		c.position = coin_spawner.position
		c.item_value = COIN_VALUES[coin_style]
		c.get_node("AnimatedSprite2D").play(animation)
		add_child(c)


## Spawing Function for use in editor because it must be interactive now
## which I'll have to come back to later.
