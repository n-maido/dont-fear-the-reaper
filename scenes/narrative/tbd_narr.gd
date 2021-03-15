extends Node2D

var dialog = preload("res://scenes/narrative/dialog.tscn")

const images = [
	preload("res://scenes/narrative/assets/village.png"),
	preload("res://scenes/narrative/assets/alley.png"),
	preload("res://scenes/narrative/assets/reaper.png"),
	preload("res://scenes/narrative/assets/catacomb.png")
]

var tbd_dialog

func _ready():
	# OS.window_fullscreen = true
	tbd_dialog = dialog.instance()
	tbd_dialog.phrases = [
		'Press the arrow buttons, or use the arrow keys on your keyboard to navigate. Or, press SPACE to skip the introduction',
		'Ahh, another day, another dawn. Time to walk to my job at the market.',
		'It’s honest work. I get to work outside and meet new people, but things are not always easy.',
		'Sometimes, thieves run off with goods. Plus, my boss can be a bit demanding, and he makes me chase after them.',
		'Anyways, I think I’ll take a different route to work. This alleyway looks interesting...',
		'The grim reaper?! Is he here for me? But I’m so young! I’m not ready to go!',
		'Narrator: The reaper has transported you to his catacombs, a limbo realm. Quick, escape!'
	]
	add_child(tbd_dialog)



func _process(delta):
	load_background()

func load_background():
	if tbd_dialog.phrase_index == 3:
		$BackgroundImage.set_texture(images[0])
	elif tbd_dialog.phrase_index == 4:
		$BackgroundImage.set_texture(images[1])
	elif tbd_dialog.phrase_index == 5:
		$BackgroundImage.set_texture(images[2])
	elif tbd_dialog.phrase_index == 6:
		$BackgroundImage.set_texture(images[3])
	else:
		$BackgroundImage.set_texture(images[0])
	

