extends Control


var fade = preload("res://scenes/animation/FadeIn.tscn")
var fade_anim

var skip_intro = preload("res://scenes/narrative/assets/skip.png")
var start_game = preload("res://scenes/narrative/assets/start.png")

var dialog = preload("res://scenes/narrative/dialog.tscn")
#var skip = preload("res://scenes/narrative/SkipButton.tscn")

const images = [
	preload("res://scenes/narrative/assets/hell.jpg"),
	preload("res://scenes/narrative/assets/parchment.png")
]

var reaper_dialog
#var reaper_skip

func _ready():
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
	
#	fade_anim = fade.instance()
#	add_child(fade_anim)


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


func _on_FadeIn_fade_finished():
	get_tree().change_scene("res://scenes/reaper_gameplay/ReaperPlayer.tscn")


func _on_ReaperSkip_pressed():
	print("Skip pressed!")
#	fade_anim.show()
#	fade_anim.fade_in()
#	get_tree().change_scene("res://scenes/reaper_gameplay/ReaperPlayer.tscn")
	$FadeIn.show()
	$FadeIn.fade_in()
