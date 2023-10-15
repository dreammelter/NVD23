extends ScreenSwitch

# alternate scene files to use depending on the button

## This file is the one set in the inspector for "scene_file"
#var _play_scene_file := "res://levels/sandbox.tscn"
var _shop_scene_file := "res://screens/shop_screen.tscn"
var _settings_scene_file := "res://screens/settings_screen.tscn"
var _close_scene_file := "res://screens/title_screen.tscn"


func _on_play_button_pressed():
	GameManager.goto_scene(scene_file)


func _on_shop_button_pressed():
	GameManager.goto_scene(_shop_scene_file)


func _on_settings_button_pressed():
	GameManager.goto_scene(_settings_scene_file)


func _on_close_button_pressed():
	GameManager.goto_scene(_close_scene_file)
