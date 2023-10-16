extends Control
## Display the Player Variables
##
## The Coin display is reused across the game, so this mostly for the "juice bar"


func update_juice_bar(juice):
	$JuiceBar.set_value_no_signal(juice)
