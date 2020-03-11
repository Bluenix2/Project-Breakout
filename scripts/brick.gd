extends StaticBody2D
class_name Brick

# This is the game manager responsible for points system
func collided(manager):
	manager.points += 1
	queue_free()
