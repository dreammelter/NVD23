class_name Booster
extends Resource
## Base resource class for Booster Foods!


@export var food_name: String
@export_multiline var short_description: String
@export var icon: Texture2D
@export var affected_stat: String
@export var change_value: float # can be casted to int as necessary
@export var price: int


## initialize so there aren't any issues using these in the editor.
func _init(init_name = "", init_desc = "", init_icon = null, init_stat = "",
		init_val = 0.0, init_price = 0):
	
	food_name = init_name
	short_description = init_desc
	icon = init_icon
	affected_stat = init_stat
	change_value = init_val
	price = init_price
