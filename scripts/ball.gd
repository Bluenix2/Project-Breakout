extends RigidBody2D

export (int) var speed

func _on_collision(body):
	if body == $"../Platform":
		set_linear_velocity(
			body.position.direction_to(position)*linear_velocity.length())
