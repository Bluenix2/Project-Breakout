extends StaticBody2D
class_name Brick

func collided(manager):
	manager.points += 1
	queue_free()
