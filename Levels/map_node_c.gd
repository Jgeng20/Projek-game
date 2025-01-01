extends Node2D

func _ready():
	MapTransition.MapNodeC.visible = false
	var player = $"y-sortObjects/player"
	player.position = Global.transition_position

func _process(delta):
	if Global.transition_scene == false:
		MapTransition.MapNodeC.visible = Global.map_visible
	elif Global.transition_scene == true:
		MapTransition.MapNodeC.visible = false

#ke nodeA
func _on_node_c_to_node_a_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(-1,-1)
		Global.transition_position = Vector2(367, 412) 
		Global.node_transition = "res://Levels/map_nodeA.tscn"
		Global.current_scene = "map_nodeA" 

func _on_node_c_to_node_a_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeB
func _on_node_c_to_node_b_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(0,-1)
		Global.transition_position = Vector2(120, 412) 
		Global.node_transition = "res://Levels/map_nodeB.tscn"
		Global.current_scene = "map_nodeB" 

func _on_node_c_to_node_b_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeD
func _on_node_c_to_node_d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(1,-1)
		Global.transition_position = Vector2(-128, 414)
		Global.node_transition = "res://Levels/map_nodeD.tscn"
		Global.current_scene = "map_nodeD" 

func _on_node_c_to_node_d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeG
func _on_node_c_to_node_g_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(1,0)
		Global.transition_position = Vector2(-128,164)
		Global.node_transition = "res://Levels/map_nodeG.tscn"
		Global.current_scene = "map_nodeG" 

func _on_node_c_to_node_g_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeF
func _on_node_c_to_node_f_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(1,1)
		Global.transition_position = Vector2(-128, -81) 
		Global.node_transition = "res://Levels/map_nodeF.tscn"
		Global.current_scene = "map_nodeF" 


func _on_node_c_to_node_f_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false
