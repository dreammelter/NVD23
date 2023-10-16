extends Node
## Autoload to keep track of player variables across scenes

## Send a signal when the coins_collected is updated
signal coins_updated(coins)

## Total coins collected across all levels
static var coins_collected: int = 10

## Inventory of Booster Foods bought from the shop.
## It's just an array of "dictionaries": food name (String) and count (int)
static var fridge: Array = []


func update_coins(amount: int) -> void:
	coins_collected += amount
	coins_updated.emit(coins_collected)
