extends Control

# store dialogue lines here
var phrases = [
	'Welcome to the narration template.',
	'Press the arrow buttons, or use the arrow keys on your keyboard to navigate. ->',
	'Or, press SPACE to skip the introduction'
]

# keep track of which phrase we're displaying
var phrase_index = 0

# keep track of when a phrase completes
var finished = false

func _ready():
	load_dialog()

func load_dialog():
	if phrase_index == 0:
		$BackButton.visible = false
	else: 
		$BackButton.visible = true
	
	if phrase_index == phrases.size() - 1:
		$NextButton.visible = false
		$SkipButton/SkipText.bbcode_text = 'Start Game'
	else:
		$NextButton.visible = true
		$SkipButton/SkipText.bbcode_text = 'Skip Intro'
	# check if index is in range
	if phrase_index < phrases.size():
		finished = false
		$TextBorder/DialogText.bbcode_text = phrases[phrase_index] # use bbcode so we can style it
		$TextBorder/DialogText.percent_visible = 0 # hide the text when we change it
		# Use tween to animate the text, so that we display the phrase 1 char at a time
		$Tween.interpolate_property(
			$TextBorder/DialogText, "percent_visible", 0, 1, 3, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free() # end dialog

func _on_Tween_tween_completed(object, key):
	finished = true


func _on_NextButton_pressed():
	phrase_index +=1
	load_dialog()


func _on_BackButton_pressed():
	phrase_index -= 1
	load_dialog()


func _on_SkipButton_pressed():
	pass # Replace with function body.
