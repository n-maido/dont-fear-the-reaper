extends Control

func _ready():
	$ColorRect/TextureRect/ColorRect/Label/TimeScore.text = "Score: " + str(Globals.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Note for whoever works on this menu: Need to set Globals.score = 0 in signal functions
