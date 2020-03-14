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

func build(id):
	for ri in min(levels[id].size(), 6):
		for bi in min(levels[id][ri].size(), 6):
			if levels[id][ri][bi]: create_brick(ri, bi)

func create_brick(ri, bi):
	var brick = brick_scn.instance()
	brick.set_position(Vector2(h_margin + h_spacing*bi, v_margin + v_spacing*ri))
	add_child(brick)
