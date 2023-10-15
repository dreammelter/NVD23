extends Node
## Autoloaded scene that handles scene transitions and game data.
## 
## Provides methods for switching scenes and saving/loading player's game data
## Might to extend FSM for the structuring Game States but we'll see.


# we could technically get the name of the scene too.

## Sub-status flag to indicate the player is in a level
var in_game := false

## Sub-status flag to indicate the player is in a menu (in or outside the game).
## True by default since the game starts with a menu screen
var in_menu := true


# Methods to handle scene transitions
