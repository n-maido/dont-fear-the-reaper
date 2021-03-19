extends Control


var skip_intro = preload("res://scenes/narrative/assets/skip.png")
var start_game = preload("res://scenes/narrative/assets/start.png")

var dialog = preload("res://scenes/narrative/dialog.tscn")
#var skip = preload("res://scenes/narrative/SkipButton.tscn")
var volume = 0

const images = [
	preload("res://scenes/narrative/assets/hell.jpg"),
	preload("res://scenes/narrative/assets/parchment.png")
]

var reaper_dialog


func _ready():
	set_process_input(true)
	reaper_dialog = dialog.instance()
	reaper_dialog.phrases = [
		'Press the arrow buttons, or use the arrow keys on your keyboard to navigate. Or, press SPACE to skip the introduction',
		'Ahh, another day, another death. Time get started with the workday. Let me consult my list...',
		'I have my little list of what I call “the TBDs” (To Be Deceased). My job is to visit each person and rip their souls out of their body. I’m no different from Santa Claus, really.',
		'It’s honest work. I get to travel the world and meet new people, but things are not always easy.',
		'People keep screaming and running away from me. I’m just trying to escort them to their deaths! Hopefully one day, people can truly appreciate me for my hard work.',
		'Anyways, back to the list. It looks like Tom is next...'
	]
	add_child(reaper_dialog)
	
	$BackgroundMusic.volume_db = volume
	$BackgroundMusic.play()



func _process(delta):
	load_background()
	load_skip_button()

func load_background():
	if reaper_dialog.phrase_index >= 2  and reaper_dialog.phrase_index <= 5:
		$BackgroundImage.set_texture(images[1])
	else:
		$BackgroundImage.set_texture(images[0])

func load_skip_button():
	if reaper_dialog.phrase_index == reaper_dialog.phrases.size() - 1:
		$ReaperSkip.texture_normal = start_game
	else:
		$ReaperSkip.texture_normal = skip_intro


func _on_ReaperSkip_pressed():
	print("Skip pressed!")

#	get_tree().change_scene("res://scenes/reaper_gameplay/ReaperPlayer.tscn")

	#fade audio
#	$Tween.interpolate_property($BackgroundMusic, "volume_db", volume, -80, 5, Tween.TRANS_SINE, Tween.EASE_IN, 0)
#	$Tween.start()
	$FadeIn.show()
	$FadeIn.fade_in()



func _on_Tween_tween_completed(object, key):
	$BackgroundMusic.stop()
	get_tree().change_scene("res://scenes/reaper_gameplay/ReaperPlayer.tscn")


func _on_FadeIn_fade_finished():
	print("fade finished")
	get_tree().change_scene("res://scenes/reaper_gameplay/ReaperPlayer.tscn")
