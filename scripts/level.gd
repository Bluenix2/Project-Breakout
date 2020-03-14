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
	],
]

func _ready():
	build(0)

func build(id):
	var level = levels[id]
	for ri in min(level.size(), 6):
		var row = level[ri]
		for bi in min(row.size(), 6):
			if row[bi]:
				var brick = brick_scn.instance()
				brick.set_position(Vector2(h_margin + (h_spacing*(bi)), v_margin + (v_spacing*(ri))))
				print(brick.position)
				add_child(brick)
