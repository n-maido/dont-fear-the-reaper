extends Control

func _ready():
	#$CenterContainer/VBoxContainer/score.text = "Score: " + str(Globals.score)
	pass	
func _on_newGame_pressed():
	#Globals.score = 0
	get_tree().change_scene("res://scenes/title/titlescreen.tscn")


func _on_exit_pressed():
	#Globals.score = 0
	pass # Replace with function body.
