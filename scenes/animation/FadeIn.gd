extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal fade_finished

func fade_in():
	$AnimationPlayer.play("fade_in")
	


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("fade_finished")
