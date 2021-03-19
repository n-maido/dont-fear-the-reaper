extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var volume = 1
var player_won


# Called when the node enters the scene tree for the first time.
func _ready():
	$BackgroundMusic.play() 
	$BackgroundMusic.volume_db = volume


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ExitArea_body_entered(body):
	var escapee = body.get_name()
	print(escapee, " has reached the exit")
	if escapee == "TBD":
		player_won = true
		end_game()
		#load losing screen here
		#get_tree().change_scene("res://scenes/tbd_gameplay/tbd_win.tscn")


func _on_TBDArea_body_entered(body):
	var collider = body.get_name()
	print(collider)
	if collider == "PlayerReaper":
		end_game()
		player_won = false
		#load win screen
		#get_tree().change_scene("res://scenes/tbd_gameplay/tbd_lose.tscn")

func end_game():
	# stop timer and save the score
	$tilemap/TBD/TimerRect/Timer.stop()
	Globals.score = $tilemap/TBD/TimerRect.count
	
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished():
	# Use tween to fade out the audio
	$Tween.interpolate_property($BackgroundMusic, "volume_db", volume, -80, 1, Tween.TRANS_SINE, Tween.EASE_IN, 0)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	$BackgroundMusic.stop()
	if player_won:
		get_tree().change_scene("res://scenes/tbd_gameplay/tbd_win.tscn")
	else:
		get_tree().change_scene("res://scenes/tbd_gameplay/tbd_lose.tscn")
