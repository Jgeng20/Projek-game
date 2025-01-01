extends Node2D

func _ready():
	MapTransition.MapNodeG.visible = false
	var player = $"y-sortObjects/player"
	player.position = Global.transition_position

func _process(delta):
	if Global.transition_scene == false:
		MapTransition.MapNodeG.visible = Global.map_visible
	elif Global.transition_scene == true:
		MapTransition.MapNodeG.visible = false


#ke nodeC
func _on_node_g_to_node_c_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.transition_way = Vector2(-1,0)
		Global.transition_position = Vector2(367, 164) 
		Global.node_transition = "res://Levels/map_nodeC.tscn"
		Global.current_scene = "map_nodeC" 
		Global.finish_changescenes()

func _on_node_g_to_node_c_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeD
func _on_node_g_to_node_d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(-1,-1)
		Global.transition_position = Vector2(367, 412) 
		Global.node_transition = "res://Levels/map_nodeD.tscn"
		Global.current_scene = "map_nodeD" 

func _on_node_g_to_node_d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeE
func _on_node_g_to_node_e_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(0,-1)
		Global.transition_position = Vector2(120, 412) 
		Global.node_transition = "res://Levels/map_nodeE.tscn"
		Global.current_scene = "map_nodeE" 

func _on_node_g_to_node_e_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeF
func _on_node_g_to_node_f_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(0,1)
		Global.transition_position = Vector2(120, -89) 
		Global.node_transition = "res://Levels/map_nodeF.tscn"
		Global.current_scene = "map_nodeF" 

func _on_node_g_to_node_f_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false
