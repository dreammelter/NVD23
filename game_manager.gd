extends Node
## Autoloaded scene that handles scene transitions and game data.
## 
## Provides methods for switching scenes and saving/loading player's game data
## Might to extend FSM for the structuring Game States but we'll see.


## current scene
var current_scene: Node = null

## Sub-status flag to indicate the player is in a level
var in_game := false

## Sub-status flag to indicate the player is in a menu (in or outside the game).
## True by default since the game starts with a menu screen
var in_menu := true


func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() -1)


# Methods to handle scene transitions using Resource Paths
## Public method for switching the scene (which ultimately waits until there's idle time)
func goto_scene(path: String) -> void:
	if not path:
		push_error("Scene file not selected - please pick a scene from the inspector!")
		return
	call_deferred("_deferred_scene_switch", path)


## The actual method for switching scene; called when it should be safe to make changes
func _deferred_scene_switch(path_to_scene) -> void:
	# see if we can load up the new scene first
	var s = ResourceLoader.load(path_to_scene)
	if not s:
		print("Scene path '{f}' is invalid. Check the error log for details."
				.format({"f":path_to_scene}))
		return
	else:
		# out with the old and in with the new
		current_scene.free()
		current_scene = s.instantiate()
		get_tree().root.add_child(current_scene)
