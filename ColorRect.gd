extends TextureRect


onready var timer = get_node("Timer")
onready var label = get_node("Time")
var count = 0 


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(0.1)
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Timer_timeout():
	count += 10
	label.set_text(str(count))
	pass # Replace with function body.
