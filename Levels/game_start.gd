extends Node2D

func _ready():
	MapTransition.MapStart.visible = false
	var player = $"y-sortObjects/player"
	var orang1 = $"y-sortObjects/orang1"
	player.position = Global.transition_position
	if Global.ending == true:
		orang1.position = Vector2(370, 158)

func _process(delta):
	if Global.transition_scene == false:
		MapTransition.MapStart.visible = Global.map_visible
	elif Global.transition_scene == true:
		MapTransition.MapStart.visible = false
	
	

func _on_start_to_node_a_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if Global.quest_start == true:
			Global.transition_scene = true
			Global.finish_changescenes()
			Global.transition_way = Vector2(1,0)
			Global.transition_position = Vector2(-128,164)
			Global.node_transition = "res://Levels/map_nodeA.tscn"
			Global.current_scene = "map_nodeA"
		else:
			Global.transition_scene = true
			Global.finish_changescenes()
			Global.transition_way = Vector2(-1,0)
			Global.transition_position = Vector2(367, 164) 
			Global.node_transition = "res://Levels/game_start.tscn"
			Global.current_scene = "game_start" 
			Dialogic.start("player_dipanggil")

func _on_start_to_node_a_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


func _on_start_to_start_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if Global.quest_start == true:
			Global.transition_scene = true
			Global.finish_changescenes()
			Global.transition_way = Vector2(1,0)
			Global.transition_position = Vector2(-128,164)
			Global.node_transition = "res://Levels/game_start.tscn"
			Global.current_scene = "game_start"
			Dialogic.start("player_noJalan")
		else:
			Global.transition_scene = true
			Global.finish_changescenes()
			Global.transition_way = Vector2(1,0)
			Global.transition_position = Vector2(-128,164)
			Global.node_transition = "res://Levels/game_start.tscn"
			Global.current_scene = "game_start"
			Dialogic.start("player_dipanggil")

func _on_start_to_start_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false
