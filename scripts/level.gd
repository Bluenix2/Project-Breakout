extends Node2D

onready var brick_scn = preload("res://scenes/brick.tscn")

const h_margin = 208
const v_margin = 256

const h_spacing = 208
const v_spacing = 128

const levels = [
	[
		[1, 1, 1, 1, 1, 1],
		[1, 0, 1, 1, 0, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 0, 1, 1, 0, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 0, 1, 1, 0, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 0, 1, 1, 0, 1],
		[1, 1, 1, 1, 1, 1],
	],
]

var points = 0 setget set_points
var level = 0 setget set_level

func set_points(value):
	points = value
	$Score.text = str(points)

func set_level(value):
	level = value
	build(level)

func build(id):
	for ri in min(levels[id].size(), 10):
		for bi in min(levels[id][ri].size(), 6):
			if levels[id][ri][bi]: create_brick(ri, bi)

func create_brick(ri, bi):
	var brick = brick_scn.instance()
	brick.set_position(Vector2(h_margin + h_spacing*bi, v_margin + v_spacing*ri))
	add_child(brick)

func _unhandled_input(event):
	if event is InputEventScreenDrag:
		$Platform.velocity = event.relative
