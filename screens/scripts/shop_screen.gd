extends ScreenSwitch


func _on_close_button_pressed():
	GameManager.goto_scene(scene_file)
