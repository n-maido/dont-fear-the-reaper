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
	$tilemap/ReaperAnimate.max_speed = 250
	$tilemap/ReaperAnimate.friction = 20
	
#	fade_anim = fade.instance()
#	add_child(fade_anim)
#	fade_anim.fade_in()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

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
		print("caught the TBD!")
		#load win screen


func _on_ExitArea_body_entered(body):
	var escapee = body.get_name()
	if escapee == "TBDIndependent":
		print("The TBD has escaped")
		#load losing screen here

