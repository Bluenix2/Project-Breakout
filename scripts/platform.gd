extends KinematicBody2D
class_name Platform

export (int) var speed

var velocity = Vector2()

func _physics_process(delta):
	move_and_collide(Vector2(velocity.x, 0))
	velocity = Vector2(0, 0)
