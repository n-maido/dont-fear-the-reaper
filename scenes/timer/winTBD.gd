extends Control

#func _ready():
#	$CenterContainer/VBoxContainer/score.text = "Score: " + str(Globals.score)

func _on_mainMenu_pressed():
	get_tree().change_scene("res://scenes/title/titlescreen.tscn")

func _on_exit_pressed():
	#Globals.score = 0
	pass # Replace with function body.
