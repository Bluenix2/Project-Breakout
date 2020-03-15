extends Node

var points = 0 setget set_points, get_points

func _ready():
	$Level.build(0)
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

func set_points(value):
	points = value
	$Score.text = str(points)

func get_points():
	return points

func _process(delta):
	process_platform(delta)

func process_platform(_delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction += -1
	if Input.is_action_pressed("ui_right"):
		direction += 1
	$Platform.direction = direction
