extends Area2D


func _draw():
	draw_circle(position, $SphereOfInlfuence.shape.radius,
				Color(1, 1, 1, 0.1))
