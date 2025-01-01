extends Node2D

func _ready():
	MapTransition.MapNodeF.visible = false
	var player = $"y-sortObjects/player"
	player.position = Global.transition_position

func _process(delta):
	if Global.transition_scene == false:
		MapTransition.MapNodeF.visible = Global.map_visible
	elif Global.transition_scene == true:
		MapTransition.MapNodeF.visible = false


#ke nodeG
func _on_node_f_to_node_g_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(0,-1)
		Global.transition_position = Vector2(120, 412) 
		Global.node_transition = "res://Levels/map_nodeG.tscn"
		Global.current_scene = "map_nodeG" 

func _on_node_f_to_node_g_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeC
func _on_node_f_to_node_c_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(-1,-1)
		Global.transition_position = Vector2(367, 412) 
		Global.node_transition = "res://Levels/map_nodeC.tscn"
		Global.current_scene = "map_nodeC" 

func _on_node_f_to_node_c_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false
