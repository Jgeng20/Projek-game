extends Control

func _ready():
	pass

func _process(delta):
	pass

func _on_button_1_pressed() -> void:
	TransitionScreen.transition()
	await get_tree().create_timer(0.5).timeout
	Global.transition_way = Vector2(1,0)
	get_tree().change_scene_to_file("res://Levels/black_screen.tscn")

func _on_button_3_pressed() -> void:
	get_tree().quit()
