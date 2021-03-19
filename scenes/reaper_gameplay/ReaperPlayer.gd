extends Node

#var fade = preload("res://scenes/animation/FadeIn.tscn")
#var fade_anim
var tbd_scene = preload("res://scenes/reaper_gameplay/tbd_independent.tscn")
var tbd #this will be an independently moving tbd


func _ready():
	randomize()
	spawn_tbd()
	
	#set reaper speed
	$tilemap/ReaperAnimate.speed = 100
	$tilemap/ReaperAnimate.acceleration = 7
	$tilemap/ReaperAnimate.max_speed = 275
	$tilemap/ReaperAnimate.friction = 15
	
#	fade_anim = fade.instance()
#	add_child(fade_anim)
#	fade_anim.fade_in()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	$TimerScene/Time.position.x = $tilemap/ReaperAnimate.position.x
#	$TimerScene/Time.position.y = $tilemap/ReaperAnimate.position.y

# spawn the tbd in a random location
func spawn_tbd():
	$tilemap/TBDPath/TBDSpawnLocation.offset = randi()

	tbd = tbd_scene.instance()
	add_child(tbd)

	tbd.position = $tilemap/TBDPath/TBDSpawnLocation.position


func _on_ReaperArea_body_entered(body):
	var collider = body.get_name()
	print(collider)
	if collider == "TBDIndependent":
		end_game()
#		print("caught the TBD! Score: ", Globals.score)
		#load win screen
		get_tree().change_scene("res://scenes/reaper_gameplay/reaper_win.tscn")



func _on_ExitArea_body_entered(body):
	var escapee = body.get_name()
	print(escapee, " has reached the exit")
	if escapee == "TBDIndependent":
		end_game()
		#load losing screen here
		get_tree().change_scene("res://scenes/reaper_gameplay/reaper_lose.tscn")

func end_game():
	# stop timer and save the score
	$tilemap/ReaperAnimate/TimerRect/Timer.stop()
 	Globals.score = $tilemap/ReaperAnimate/TimerRect.count
