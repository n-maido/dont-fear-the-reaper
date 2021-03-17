extends TextureButton

var skip_intro = preload("res://scenes/narrative/assets/skip.png")
var start_game = preload("res://scenes/narrative/assets/start.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	if $Dialog.phrase_index == $Dialog.phrases.size() - 1:
		$NextButton.visible = false
		$SkipButton.texture_normal = start_game
	else:
		$NextButton.visible = true
		$SkipButton.texture_normal = skip_intro


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
