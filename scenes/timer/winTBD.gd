extends Control

onready var score = get_node("ColorRect/VBoxContainer/score")

func _ready():
	$ColorRect/VBoxContainer/score.set_text("Score: " + str(Globals.score))
	
func _on_mainMenu_pressed():
	get_tree().change_scene("res://scenes/title/titlescreen.tscn")

func _on_exit_pressed():
	Globals.score = 0
	get_tree().quit()
