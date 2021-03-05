extends KinematicBody2D


# Declare member variables here. Examples:
var speed : int = 200
var vel = Vector2()
# velocity - how many pixels/second we are moving
# var vel : Vector2 = Vector2()

onready var reaper :  Sprite = get_node("reaper_right")

func get_input():
	vel = Vector2()
	#vel.x = 0		# required to stop Sprite once button is no longer being pressed
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	if Input.is_action_pressed("move_up"):
		vel.y -= speed
	if Input.is_action_pressed("move_down"):
		vel.y += speed

# _physics_process function is called 60 times a second
func _physics_process(delta):
	get_input()	
	vel = vel.normalized() * speed			# prevents Sprite from moving faster diagonally 
	vel = move_and_slide(vel)
	
	if vel.x < 0:
		reaper.flip_h = true
	if vel.x > 0:
		reaper.flip_h = false

