extends Node

func _process(delta):
	process_platform(delta)

func process_platform(_delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction += -1
	if Input.is_action_pressed("ui_right"):
		direction += 1
	$Platform.direction = direction
