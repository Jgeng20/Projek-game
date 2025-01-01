extends Node2D

func _ready():
	MapTransition.MapNodeB.visible = false
	var player = $"y-sortObjects/player"
	player.position = Global.transition_position

func _process(delta):
	if Global.transition_scene == false:
		MapTransition.MapNodeB.visible = Global.map_visible
	elif Global.transition_scene == true:
		MapTransition.MapNodeB.visible = false

# ke nodeA
func _on_node_b_to_node_a_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(-1,1)
		Global.transition_position = Vector2(367, -84) 
		Global.node_transition = "res://Levels/map_nodeA.tscn"
		Global.current_scene = "map_nodeA" 

func _on_node_b_to_node_a_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke NodeC
func _on_node_b_to_node_c_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(0,1)
		Global.transition_position = Vector2(120, -89) 
		Global.node_transition = "res://Levels/map_nodeC.tscn"
		Global.current_scene = "map_nodeC" 

func _on_node_b_to_node_c_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeD
func _on_node_b_to_node_d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(1,1)
		Global.transition_position = Vector2(-128, -81) 
		Global.node_transition = "res://Levels/map_nodeD.tscn"
		Global.current_scene = "map_nodeD" 
		
func _on_node_b_to_node_d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeE
func _on_node_b_to_node_e_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(1,0)
		Global.transition_position = Vector2(-128,164)
		Global.node_transition = "res://Levels/map_nodeE.tscn"
		Global.current_scene = "map_nodeE" 

func _on_node_b_to_node_e_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false
