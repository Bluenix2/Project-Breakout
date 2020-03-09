extends RigidBody2D
class_name Ball

export (int) var speed

func _ready():
	set_linear_velocity(Vector2(500, 500))

func _on_collision(body):
	if body is Platform:
		set_linear_velocity(
			body.position.direction_to(position)*linear_velocity.length())
	
	if body is Brick:
		body.collided()
