class_name Collectible
extends Area2D
## Base class for items that a character can pick up.
## 
## Bring Your Own Collision Shape.

@export var item_type := "item"

# Destroy self once collected by a Player or Enemy
func _on_body_entered(body: Node2D) -> void:
	prints(body.name,"picked up {i}!".format({"i":item_type}))
	
	body.item_collected.emit(item_type)
	
	if item_type == "fruit":
		# if the body doesn't charge, leave the fruit
		if body.charge(10):
			queue_free()
		return
	
	queue_free()
