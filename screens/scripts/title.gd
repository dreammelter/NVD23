extends ScreenSwitch


func _on_start_button_pressed():
	GameManager.goto_scene(scene_file)
