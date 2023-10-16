extends Node2D

@export var testing: Resource

@onready var pause_layer = $PauseLayer
@onready var hud_layer = $HUDLayer


# Called when the node enters the scene tree for the first time.
func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("start") and not GameManager.in_menu:
		get_tree().paused = true
		GameManager.in_menu = true
		$PauseLayer.show()
		$HUDLayer.hide()
	else: 
		# technically doesn't register but I'll leave this here.
		$PauseLayer.hide()
		GameManager.in_menu = false
		get_tree().paused = false


func _ready() -> void:
	GameManager.in_game = true
	GameManager.in_menu = false


func _on_pause_menu_closed():
	$HUDLayer.show()
