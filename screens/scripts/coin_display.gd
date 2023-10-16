extends HBoxContainer
## Displays coins_collected from Player Variables across the game

@onready var amount = $Amount as Label

func _ready():
	PlayerData.coins_updated.connect(_on_player_data_coins_updated)
	update_amount(PlayerData.coins_collected)


func update_amount(coins: int):
	amount.text = str(coins)


func _on_player_data_coins_updated(coins):
	update_amount(coins)
