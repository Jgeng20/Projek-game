extends Control

func _ready() -> void:
	resume()
	$AnimationPlayer.play("RESET")

func _process(_delta):
	Esc()

func resume():
	if Global.game_done == false and Global.game_over == false:
		Global.game_pause = false
		get_tree().paused = false
		$AnimationPlayer.play("fade_to_white")
		visible = false
	elif Global.game_done == true:
		$VBoxContainer/Button1.disabled = true
		$Button2.disabled = false
		pause()
	elif Global.game_over == true:
		$VBoxContainer/Button1.disabled = true
		$Button1.disabled = false
		pause()

func pause():
	Global.game_pause = true
	get_tree().paused = true
	$AnimationPlayer.play("fade_to_black")
	visible = true

func Esc():
	if Input.is_action_just_pressed("esc"):
		if Global.game_pause == true:
			resume()
		elif Global.game_pause == false:
			pause()

func _on_button_1_pressed() -> void:
	resume()

func _on_button_2_pressed() -> void:
	TransitionScreen.transition()
	
	Global.game_pause = false
	Global.current_scene = "game_start"
	Global.transition_scene = false
	Global.transition_way
	Global.node_transition
	Global.in_dialogue = false
	Global.reset_home = true
	Global.map_visible = false
	Global.hint_visible = false
	Global.to_orang1 = false
	Global.to_orang2 = false
	Global.orang2_disable = false
	Global.orang2_berpaling = false
	Global.quest_complite = true
	Global.mission_complite = false
	Global.dialogue_name
	Global.ending = false
	Global.deadGrandma = false
	Global.transition_position = Vector2(-128,164)
	
	get_tree().change_scene_to_file("res://Levels/game_start.tscn")
	
func _on_button_3_pressed() -> void:
	get_tree().quit()
