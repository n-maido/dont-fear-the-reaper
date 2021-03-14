extends Node2D

var tbd_scene = preload("res://scenes/reaper_gameplay/tbd_independent.tscn")
var tbd #this will be an independently moving tbd

# Called when the node enters the scene tree for the first time.
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
