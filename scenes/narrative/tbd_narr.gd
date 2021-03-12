extends Node2D

var dialog = preload("res://scenes/narrative/dialog.tscn")

const images = [
	preload("res://scenes/narrative/assets/hell.jpg"),
	preload("res://scenes/narrative/assets/parchment.jpg")
]

var tbd_dialog

func _ready():
	tbd_dialog = dialog.instance()
	tbd_dialog.phrases = [
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
	if tbd_dialog.phrase_index == 2:
		$BackgroundImage.set_texture(images[1])
	elif tbd_dialog.phrase_index == 3:
		$BackgroundImage.set_texture(images[1])
	elif tbd_dialog.phrase_index == 4:
		$BackgroundImage.set_texture(images[1])
	elif tbd_dialog.phrase_index == 5:
		$BackgroundImage.set_texture(images[1])
	else:
		$BackgroundImage.set_texture(images[0])
	

