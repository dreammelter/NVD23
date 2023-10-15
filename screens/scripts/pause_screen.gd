extends ScreenSwitch


# the default scene file should be whatever level is loaded...
# that'll be the file the close button uses.
var _settings_scene_file := "res://screens/settings_screen.tscn"
var _exit_scene_file := "res://screens/main_menu.tscn"


func _on_close_button_pressed():
	GameManager.goto_scene(scene_file)


func _on_exit_game_button_pressed():
	GameManager.goto_scene(_exit_scene_file)


func _on_settings_button_pressed():
	GameManager.goto_scene(_settings_scene_file)
