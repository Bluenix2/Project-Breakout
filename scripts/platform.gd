extends KinematicBody2D
class_name Platform

export (int) var speed

var velocity = Vector2()
var direction = 0

func _physics_process(delta):
	velocity.x = speed * direction
	velocity = move_and_slide(velocity)
