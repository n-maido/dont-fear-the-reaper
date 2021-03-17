extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Container/ReaperRect/Reaper.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Reaper_pressed():
	get_tree().change_scene("res://scenes/narrative/reaper_narr.tscn")
	pass # Replace with function body.


func _on_Tom_pressed():
	get_tree().change_scene("res://scenes/narrative/tbd_narr.tscn")
	pass # Replace with function body.
