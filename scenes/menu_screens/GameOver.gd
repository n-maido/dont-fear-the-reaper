extends Control

func _ready():
	$ColorRect/TextureRect/ColorRect/Label/TimeScore.set_text("Score: " + str(Globals.score))
	$ColorRect/HBoxContainer/ColorRect/Button.grab_focus()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Note for whoever works on this menu: Need to set Globals.score = 0 in signal functions


func _on_Button_pressed():
	Globals.score = 0
	get_tree().change_scene("res://scenes/title/titlescreen.tscn")


func _on_RestartButton_pressed():
	Globals.score = 0
	get_tree().change_scene("res://scenes/Play_as/Play_As.tscn")


func _on_ExitButton_pressed():
	Globals.score = 0
	get_tree().quit()
