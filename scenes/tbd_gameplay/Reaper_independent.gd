extends KinematicBody2D

onready var tbd = get_parent().get_node("TBD")
onready var reaperAnimation = get_node("ReaperAnimation")
var speed = 125
var velocity = Vector2.ZERO
var coin_flip
var caught_TBD = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.ZERO
	velocity = position.direction_to(tbd.position) * speed
	if velocity.x > 0:
		reaperAnimation.play("run_right")
	else:
		reaperAnimation.play("run_left")
		
	# if reaper has collided with a wall, adjust its velocity	
	if is_on_wall() and !caught_TBD:
		coin_flip = heads_or_tails()
		if coin_flip == "heads":
			if velocity.y < 0 :
				velocity.y -= 100
			else:
				velocity.y += 100
			velocity.x = 0
		else: 
			if velocity.x < 0 :
				velocity.x -= 100
			else:
				velocity.x += 100
			velocity.y = 0
		
		
	velocity = move_and_slide(velocity)

func heads_or_tails():
	var result = randi()
	if result % 2 == 0:
		return "tails"
	else:
		return "heads"

func _on_ReaperArea_area_entered(area):
	print("an area was detected")
	
func _on_ReaperArea_body_entered(body):
	var collider = body.get_name()
	print(collider)
	if collider == "TBD":
		caught_TBD = true
		print("caught the TBD!")
