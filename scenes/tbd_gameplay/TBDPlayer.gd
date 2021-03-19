extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ExitArea_body_entered(body):
	var escapee = body.get_name()
	print(escapee, " has reached the exit")
	if escapee == "TBD":
		end_game()
		#load losing screen here
		get_tree().change_scene("res://scenes/tbd_gameplay/tbd_win.tscn")


func _on_TBDArea_body_entered(body):
	var collider = body.get_name()
	print(collider)
	if collider == "PlayerReaper":
		end_game()
		#load win screen
		get_tree().change_scene("res://scenes/tbd_gameplay/tbd_lose.tscn")

func end_game():
	# stop timer and save the score
	$tilemap/TBD/TimerRect/Timer.stop()
	# Globals.score = $tilemap/TBD/TimerRect.count
