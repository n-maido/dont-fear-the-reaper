extends Control

# store dialogue lines here
var dialog = [
	'Welcome to the narration template.',
	'Press the arrow buttons, or use the arrow keys on your keyboard to navigate. ->',
	'Or, press SPACE to skip the introduction'
]

# keep track of which phrase we're displaying
var dialog_index = 0

# keep track of when a phrase completes
var finished = false

# keep track of whether we increment or decrement the index
# depends on if the next or back button is pressed
var next = false
var back = false

# style text


func _ready():
	load_dialog()

func load_dialog():
	if dialog_index == 0:
		$BackButton.visible = false
	else: 
		$BackButton.visible = true
	
	if dialog_index == dialog.size() - 1:
		$NextButton.visible = false
		$SkipButton/SkipText.bbcode_text = 'Start Game'
	else:
		$NextButton.visible = true
		$SkipButton/SkipText.bbcode_text = 'Skip Intro'
	# check if index is in range
	if dialog_index < dialog.size():
		finished = false
		$TextBorder/DialogText.bbcode_text = dialog[dialog_index] # use bbcode so we can style it
		$TextBorder/DialogText.percent_visible = 0 # hide the text when we change it
		# Use tween to animate the text, so that we display the phrase 1 char at a time
		$Tween.interpolate_property(
			$TextBorder/DialogText, "percent_visible", 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free() # end dialog
	
	# increment index if next button is pressed, decrement if back button is pressed
#	if next:
#		dialog_index += 1
#		next = false
#	elif back:
#		print("back", dialog_index)
#		dialog_index = dialog_index - 1
#		back = false
	
#func _process(delta):
#	# check for user input
#	if Input.is_action_just_pressed("ui_accept"):
#		load_dialog() # load the next phrase


func _on_Tween_tween_completed(object, key):
	finished = true


func _on_NextButton_pressed():
#	next = true
#	back = false
	dialog_index +=1
	load_dialog()


func _on_BackButton_pressed():
#	next = false
#	back = true
	dialog_index -= 1
	load_dialog()


func _on_SkipButton_pressed():
	pass # Replace with function body.
