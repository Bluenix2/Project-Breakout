extends Node

onready var viewport = get_viewport()
onready var game_size = Vector2(
	ProjectSettings.get_setting("display/window/size/width"),
	ProjectSettings.get_setting("display/window/size/height"))

func _ready():
	viewport.connect("size_changed", self, "resize_window")
	resize_window()

func resize_window():
	var new_size = OS.get_window_size()
	var scale_factor

	if new_size.x < game_size.x:
		scale_factor = game_size.x/new_size.x
		new_size = Vector2(game_size.x, new_size.y*scale_factor)
	if new_size.y < game_size.y:
		scale_factor = game_size.y/new_size.y
		new_size = Vector2(new_size.x*scale_factor, game_size.y)
	
	viewport.set_size_override(true, new_size)

func _process(delta):
	process_platform(delta)

func process_platform(_delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction += -1
	if Input.is_action_pressed("ui_right"):
		direction += 1
	$Platform.direction = direction
