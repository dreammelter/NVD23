extends ScreenSwitch
## Parent this on its own Canvas Layer
## 
##
## the default scene_file could be whatever level is loaded...
## as a backup. It shouldn't be used, however.


signal pause_menu_closed()

var _settings_scene_file := "res://screens/settings_screen.tscn"
var _exit_scene_file := "res://screens/main_menu.tscn"



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("start"):
		print("PAUSE: Action event captured! (start)")
		_on_close_button_pressed() # still not running for whatever reason


func _on_close_button_pressed() -> void:
	GameManager.in_menu = false
	get_tree().paused = false
	
	if get_parent():
		get_parent().hide()
	else:
		GameManager.goto_scene(scene_file)
	
	pause_menu_closed.emit()

func _on_exit_game_button_pressed() -> void:
	GameManager.goto_scene(_exit_scene_file)


func _on_settings_button_pressed():
	GameManager.goto_scene(_settings_scene_file)
