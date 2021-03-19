extends Control


func _ready():
	$CollisionDialog.percent_visible = 0
	
	$Timer.wait_time = 2
	
	# Use tween to animate the text, so that we display the phrase 1 char at a time
	$Tween.interpolate_property(
		$CollisionDialog, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$Tween.start()



func _on_Tween_tween_completed(object, key):
	$Timer.start() #wait 2s after text animation finishes


func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/menu_screens/GameOver.tscn")
