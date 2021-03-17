extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var label = get_node("Control/ColorRect/TextureRect/ColorRect/Label/TimeScore")


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	
func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		$NewGame.show()
		$TimeRect.hide()
	
	if Input.is_action_pressed("ui_select"):
		var time = get_node("TimeRect/Time")
		label.set_text(time.get_text())
		$Control.show()
		$TimeRect.hide()

