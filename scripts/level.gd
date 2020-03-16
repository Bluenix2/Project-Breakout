extends Node2D

onready var brick_scn = preload("res://scenes/brick.tscn")

const h_margin = 208
const v_margin = 256

const h_spacing = 208
const v_spacing = 128

const levels = [
	[
		[1, 1, 1, 1, 1, 1],
	],
	[
		[1, 1, 1, 1, 1, 1],
		[0, 0, 1, 1, 0, 0],
		[1, 1, 1, 1, 1, 1],
	],
	[
		[0, 1, 0, 0, 1, 0],
		[1, 0, 1, 1, 0, 1],
		[0, 1, 0, 0, 1, 0],
		[1, 0, 1, 1, 0, 1],
	],
	[
		[0, 0, 0, 0, 0, 0],
		[1, 1, 1, 1, 1, 1],
		[1, 0, 1, 0, 1, 0],
		[0, 1, 0, 1, 0, 1],
		[1, 1, 1, 1, 1, 1]
	],
	[
		[1, 1, 1, 1, 1, 1],
		[1, 0, 1, 1, 0, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 0, 1, 1, 0, 1],
		[1, 1, 1, 1, 1, 1],
	],
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
	[
		[1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1],
	],
]

var points = 0 setget set_points
var level = 0

func set_points(value):
	points = value
	$Score.text = str(points)

func _ready():
	build(level)

func build(id):
	level = id
	for ri in min(levels[id].size(), 10):
		for bi in min(levels[id][ri].size(), 6):
			if levels[id][ri][bi]: create_brick(ri, bi)

func create_brick(ri, bi):
	var brick = brick_scn.instance()
	brick.set_position(Vector2(h_margin + h_spacing*bi, v_margin + v_spacing*ri))
	$Bricks.add_child(brick)

func calculate_levelup():
	if not $Bricks.get_child_count():
		build(level + 1)

func _unhandled_input(event):
	if event is InputEventScreenDrag:
		$Platform.velocity = event.relative
