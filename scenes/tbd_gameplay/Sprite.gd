extends Sprite

var speed = 150
var path : = PoolVector2Array()
onready var animationPlayer = get_node("ReaperPlayer/ReaperAnimation")

func _process(delta):
	# Calculate the movement distance for this frame
	var distance_to_walk = speed * delta
	
	# Move the player along the path until he has run out of movement or the path ends.
	while distance_to_walk > 0 and path.size() > 0:
		var distance_to_next_point = position.distance_to(path[0])
		if distance_to_walk <= distance_to_next_point:
			# The player does not have enough movement left to get to the next point.
			position += position.direction_to(path[0]) * distance_to_walk
			if position.direction_to(path[0]).x<0:
				animationPlayer.play("run_left")
				print("Moving Left")
			else:
				animationPlayer.play("run_right")
				print("Moving Right")
		else:
			# The player get to the next point
			position = path[0]
			path.remove(0)
		# Update the distance to walk
		distance_to_walk -= distance_to_next_point
