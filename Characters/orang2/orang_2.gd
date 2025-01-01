extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO

var player_in_area
var walk_out = false
var is_fading_out = false
var fade_out_speed = 0.1

@onready var animation_tree = $AnimationTree
@onready var sprite = $Sprite2D

func _physics_process(_delta):
	player_berpaling()
	player_movement()
	player_walkout()
	player_out_condition()
	disable_player()
	player_fading()

func orang1():
	pass

func player_fading():
	if is_fading_out == true:
		if sprite.modulate.a > 0:
			await get_tree().create_timer(0.1).timeout
			sprite.modulate.a -= fade_out_speed
		elif sprite.modulate.a <= 0: 
			sprite.modulate.a = 0
			self.set_process(false)
			self.set_physics_process(false)
			self.visible = false
			self.collision_layer = 0
			self.collision_mask = 0
			Global.orang2_disable == true

func disable_player():
	if Global.orang2_disable == true:
		print("disable")
		self.set_process(false)
		self.set_physics_process(false)
		self.visible = false
		self.collision_layer = 0
		self.collision_mask = 0

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
	if body.has_method("player") and walk_out == false and Global.quest_complite == false:
		player_in_area = true
		Global.in_dialogue = true
		Global.to_orang2 = true
		Global.dialogue_name = "chatOrang2"
		walk_out = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false

func player_berpaling():
	if Global.orang2_berpaling == true:
		$AnimationTree.set("parameters/idle/blend_position", Vector2(-1, 0))
		Global.orang2_berpaling = false

func player_out_condition():
	if Global.transition_scene == true:
		Global.orang2_disable == true

var target_positions = [Vector2(311, 237), Vector2(314, 237)]
var current_target_index = 0

func player_walkout():
	if walk_out == true and Global.in_dialogue == false:
		if current_target_index < target_positions.size():
			var target_position = target_positions[current_target_index]
			direction = (target_position - global_position).normalized()
			if global_position.distance_to(target_position) < 1:
				global_position = target_position
				current_target_index += 1
		else:
			is_fading_out = true
			direction = Vector2.ZERO
			walk_out = false
