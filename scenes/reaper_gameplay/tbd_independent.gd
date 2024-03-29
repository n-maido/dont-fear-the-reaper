extends KinematicBody2D

const GRAVITY = 10
var speed = 400
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var keep_generating = false
var direction
var x_speed
var y_speed
var coin_flip #determines which direction and which axis to move on
var reaper_detected = false


const FRICTION = 15

onready var animationPlayer = get_node("TBDAnimation")

func  _ready():
	coin_flip = heads_or_tails()
	if coin_flip == "heads":
		direction = 1
	else:
		direction = -1
	
	coin_flip = heads_or_tails()
	if coin_flip == "heads":
		x_speed = speed
		y_speed = 0
	else:
		y_speed = speed
		x_speed = 0

func _physics_process(delta):
	
	velocity.x = x_speed * direction
	velocity.y = y_speed * direction
	
	if velocity.x >= 0:
		animationPlayer.play("TBD_right")
	else:
		animationPlayer.play("TBD_left")
		
	velocity = move_and_slide(velocity)
	
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		print(collision.collider.name)
	
	if is_on_wall() or reaper_detected:
		reaper_detected = false
		direction = direction * -1
		coin_flip = heads_or_tails()
		if coin_flip == "heads":
			x_speed = speed
			y_speed = 0
		else:
			y_speed = speed
			x_speed = 0
	
	
		
func heads_or_tails():
	var result = randi()
	print("result: ", result)
	if result % 2 == 0:
		return "tails"
	else:
		return "heads"


func _on_Area2D_body_entered(body):
	reaper_detected = true
	print("reaper detected")
	

