extends Node
## Autoload to keep track of player variables across scenes


## Total coins collected across all levels
static var coins_collected: int

## Inventory of Booster Foods bought from the shop.
## It's just an array of "dictionaries": food name (String) and count (int)
static var fridge: Array = []

## 
