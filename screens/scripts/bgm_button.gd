extends Button
## Toggle BGM on/off and update the displayed text.
## 
## Be aware of ui_accept. It'll toggle it when you mean to do something else...


func _ready():
	# make sure the text is correctly
	var bgm_on = GameManager.is_playing_BGM()
	if bgm_on:
		button_pressed = bgm_on
#		_set_text(button_pressed) # doesn't run...


func _on_toggled(button_pressed):
	_set_text(button_pressed)
	GameManager.pause_BGM(button_pressed)


## utility for setting the button text according to toggle status
func _set_text(button_pressed):
	if button_pressed:
		text = "Off"
	else:
		text = "On"
