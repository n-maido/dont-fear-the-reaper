extends Node

var tbd_scene = preload("res://scenes/reaper_gameplay/tbd_independent.tscn")
var tbd #this will be an independently moving tbd


func _ready():
	randomize()
	spawn_tbd()


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
