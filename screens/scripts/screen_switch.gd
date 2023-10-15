class_name ScreenSwitch
extends Node
## Boilerplate to help make scene switching a tiny bit easier. Maybe.
## 
## Pick the file you want to switch to in the inspector.
## Then connect to a button's pressed signal in the root node of the originating scene.
## Use the Game Manager's goto_scene method and pass it the scene file.

## File Path of the scene to switch to
@export_file var scene_file: String
