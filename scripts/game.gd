extends Node

func _ready():
	resize_window()

func resize_window():
	var game_size = Vector2(
		ProjectSettings.get_setting("display/window/size/width"),
		ProjectSettings.get_setting("display/window/size/height"))
	var new_size = OS.get_window_size()
	var scale_factor

	if new_size.x < game_size.x:
		scale_factor = game_size.x/new_size.x
		new_size = Vector2(game_size.x, new_size.y*scale_factor)
	if new_size.y < game_size.y:
		scale_factor = game_size.y/new_size.y
		new_size = Vector2(new_size.x*scale_factor, game_size.y)
	
	get_viewport().set_size_override(true, new_size)
