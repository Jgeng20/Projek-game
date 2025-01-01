extends Control

func _ready():
	Dialogic.start("orang1_panggil")

func _process(delta: float) -> void:
	if Global.exit_intro == true:
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(1,0)
		Global.transition_position = Vector2(-128,164)
		Global.node_transition = "res://Levels/game_start.tscn"
		Global.current_scene = "game_start"
		Global.exit_intro = false
