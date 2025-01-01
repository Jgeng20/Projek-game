extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO

var player_in_area

@onready var animation_tree = $AnimationTree
@onready var sprite = $Sprite2D

func _physics_process(_delta):
	player_movement()

func orang1():
	pass

func player_movement():
	velocity = direction * 10
	
	direction = direction.normalized()
	
	if direction == Vector2.ZERO:
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/walk"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/walk"] = true
		animation_tree.set("parameters/idle/blend_position", direction)
		animation_tree.set("parameters/walk/blend_position", direction)
		move_and_slide()

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func _on_area_2d_body_entered(body: Node2D) -> void:
		player_in_area = true
		Global.in_dialogue = true
		Global.dialogue_name = "chatOrang2"

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
