extends Node2D

func _ready():
	MapTransition.MapNodeA.visible = false
	var player = $"y-sortObjects/player"
	player.position = Global.transition_position

func _process(delta):
	if Global.transition_scene == false:
		MapTransition.MapNodeA.visible = Global.map_visible
	elif Global.transition_scene == true:
		MapTransition.MapNodeA.visible = false
	
# ke node start
func _on_node_a_to_start_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(-1,0)
		Global.transition_position = Vector2(367, 164) 
		Global.node_transition = "res://Levels/game_start.tscn"
		Global.current_scene = "game_start" 

func _on_node_a_to_start_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false

# ke nodeB
func _on_node_a_to_node_b_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(1,-1)
		Global.transition_position = Vector2(-128, 414) 
		Global.node_transition = "res://Levels/map_nodeB.tscn"
		Global.current_scene = "map_nodeB" 

func _on_node_a_to_node_b_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


#ke nodeC
func _on_node_a_to_node_c_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.finish_changescenes()
		Global.transition_way = Vector2(1,1)
		Global.transition_position = Vector2(-128, -81) 
		Global.node_transition = "res://Levels/map_nodeC.tscn"
		Global.current_scene = "map_nodeC" 

func _on_node_a_to_node_c_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false
