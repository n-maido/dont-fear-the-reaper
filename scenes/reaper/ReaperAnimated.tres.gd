extends KinematicBody2D

# Declare member variables here. Examples:
# var speed : int = 200
var speed = 200
var acceleration = 15
var max_speed = 450
var friction = 15
var vel = Vector2.ZERO		# velocity - how many pixels/second we are moving

onready var animationPlayer = get_node("ReaperAnimation")

# _physics_process function is called 60 times a second
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	# the following lines can be imagined as a graph
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	# multiply vel by delta to maintain speed if frame is lagging
	if input_vector != Vector2.ZERO:
		if input_vector.x > 0 :
			animationPlayer.play("run_right")
		else:
			animationPlayer.play("run_left")
		vel += input_vector * acceleration
		vel = vel.clamped(max_speed)
	else:
		animationPlayer.stop()
		vel = vel.move_toward(Vector2.ZERO, friction)
	
	vel = move_and_slide(vel) 
	
	

