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
	
	if body.has_signal("item_collected"):
		body.item_collected.emit(item_type)
	
	if item_type == "fruit":
		# if body.charge returns true, leave the fruit
		if not body.charge(item_value):
			queue_free()
	
	if item_type == "coin" and body.has_method("bank"):
		body.bank(item_value) # gold coins net 10, silver 5
		queue_free()
