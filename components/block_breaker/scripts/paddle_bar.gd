extends StaticBody2D


const REGION_X := 143.0
const REGION_W := 17.0
const REGION_H := 8.0

## All the paddles are in the same area of the sprite sheet
## Use these to change the Rect.y coord of the region and select a paddle
@export var player_paddle_region: int = 16 # blue zig-zag, default
@export var enemy_paddle_region: int = 48 # red with bars

@onready var bar = $Bar as Sprite2D



## Set the color of the paddle bar to the enemy color
func use_enemy_color() -> void:
	bar.region_rect = Rect2(REGION_X,enemy_paddle_region as float,REGION_W,REGION_H)
