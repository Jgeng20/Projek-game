extends Node2D

func _ready():
	MapTransition.MapNodeE.visible = false
	var player = $"y-sortObjects/player"
	player.position = Global.transition_position

func _process(delta):
	if Global.transition_scene == false:
		MapTransition.MapNodeE.visible = Global.map_visible
	elif Global.transition_scene == true:
		MapTransition.MapNodeE.visible = false


#ke nodeB
func _on_node_e_to_node_b_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.transition_way = Vector2(-1,0)
		Global.transition_position = Vector2(367, 164) 
		Global.node_transition = "res://Levels/map_nodeB.tscn"
		Global.current_scene = "map_nodeB" 
		Global.finish_changescenes()

func _on_node_e_to_node_b_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeG
func _on_node_e_to_node_g_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(0,1)
		Global.transition_position = Vector2(120, -89) 
		Global.node_transition = "res://Levels/map_nodeG.tscn"
		Global.current_scene = "map_nodeG" 

func _on_node_e_to_node_g_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false
