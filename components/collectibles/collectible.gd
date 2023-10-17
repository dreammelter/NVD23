class_name Collectible
extends Area2D
## Base class for items that a character can pick up.
## 
## Bring Your Own Collision Shape.

@export var item_type := "item"
@export var item_value: int = 10

# Destroy self once collected by a Player or Enemy
func _on_body_entered(body: Node2D) -> void:
	prints(body.name,"picked up {i}!".format({"i":item_type}))
	
	if not body.is_in_group("enemies"):
		body.item_collected.emit(item_type)
		($CollectibleJingle as AudioStreamPlayer).play() # Not playing???
	
	if item_type == "fruit":
		# if body.charge returns true, leave the fruit
		if not body.charge(item_value):
			queue_free()
	
	if item_type == "coin" and body.has_method("bank"):
		body.bank(item_value) # gold coins net 10, silver 5
		PlayerData.update_coins(item_value)
		queue_free()



func _on_collectible_jingle_finished():
	print("Collectible Jingle Played!!")
