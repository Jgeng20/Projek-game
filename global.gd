extends Node

var exit_intro = false
var game_pause = false
var quest_start = false
var current_scene = "game_start"
var transition_scene = false
var transition_way
var node_transition
var in_dialogue = false
var reset_home = true
var map_visible = false
var hint_visible = false
var to_orang1 = false
var to_orang2 = false
var orang2_disable = false
var orang2_berpaling = false
var quest_complite = false
var mission_complite = false
var dialogue_name
var ending = false
var deadGrandma = false
var game_done = false
var game_over = false
var transition_position = Vector2(-128,164)

func _ready():
	if !is_instance_valid(get_tree()):
		print("Scene telah berubah, melanjutkan operasi")
	else:
		print("Masih di scene yang aktif")
	Dialogic.signal_event.connect(dialog_exit)

func finish_changescenes():
	if map_visible == true:
		MapTransition.transition()
	TransitionScreen.transition()
	await get_tree().create_timer(0.5).timeout
	transition_scene = false
	get_tree().change_scene_to_file(node_transition)
	await TransitionScreen.on_transition_finished

func dialog_exit(arg: String):
	if arg == "dialogue_done":
		print("dialogue_done")
		in_dialogue = false
	elif arg == "map_on":
		MapTransition.transition()
		await get_tree().create_timer(0.3).timeout
		map_visible = true
	elif arg == "intro_exit":
		exit_intro = true
	elif arg == "quest_start":
		quest_start = true
	elif arg == "hint_on":
		HintTransition.transition()
		await get_tree().create_timer(0.3).timeout
		hint_visible = true
	elif arg == "berpaling":
		orang2_berpaling = true;
	elif arg == "quest_complite":
		print("quest_complite")
		in_dialogue = false
		quest_complite = true;
		reset_home = true
	elif arg == "mision_complite":
		mission_complite = true
	elif arg == "deadGrandma":
		deadGrandma = true
	elif arg == "ending":
		print("ending")
		in_dialogue = false
		if map_visible == true:
			MapTransition.transition()
			map_visible = false
		HintTransition.transition()
		await get_tree().create_timer(0.3).timeout
		hint_visible = false
		TransitionScreen.animation_player.speed_scale = 0.1
		transition_way = Vector2(0,0)
		transition_position = Vector2(120, 94) 
		node_transition = "res://Levels/game_start.tscn"
		current_scene = "game_start"
		TransitionScreen.transition()
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file(node_transition)
		ending = true
		await TransitionScreen.on_transition_finished
		if mission_complite == true:
			Dialogic.start("mision_success")
		elif mission_complite == false:
			Dialogic.start("mision_fail")
		to_orang2 = true
		transition_scene = false
		in_dialogue = true
	elif arg == "game_done":
		game_done = true
	elif arg == "game_over":
		game_over = true
