extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO

var player_in_area
var walk_out = false
var is_fading_out = false
var fade_out_speed = 0.005

@onready var animation_tree = $AnimationTree
@onready var sprite = $Sprite2D
@onready var area = $Area2D/CollisionShape2D

func _physics_process(_delta):
	player_movement()
	player_walkout()
	player_out_condition()
	disable_player()
	dead()
	player_fading()

func orang1():
	pass

func dead():
	if Global.deadGrandma == true and rotation_degrees > -90:
		walk_out = true
		rotation_degrees -= 0.5
		self.position += Vector2(0, 0.05)
		if rotation_degrees > -40:
			is_fading_out = true

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
	if Global.reset_home == false:
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
	if body.has_method("player") and walk_out == false and Global.reset_home == true and Global.ending == false and Global.in_dialogue == false:
		player_in_area = true
		Global.in_dialogue = true
		Global.to_orang1 = true
		if Global.quest_complite == true:
			Global.dialogue_name = "question1"
		elif Global.quest_complite == false:
			Global.dialogue_name = "chatOrang1"
		walk_out = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false

func player_out_condition():
	if Global.transition_scene == true and walk_out == true:
		Global.reset_home = false

var target_positions
var current_target_index = 0

func player_walkout():
	if Global.quest_complite == false:
		target_positions = [Vector2(178, 240), Vector2(-69, 240)]
	elif Global.quest_complite == true and Global.ending == false:
		target_positions = [Vector2(300, 240)]
	elif Global.quest_complite == true and Global.ending == true:
		target_positions = [Vector2(400, 240)]
	
	if walk_out == true and Global.in_dialogue == false or Global.ending == true:
		
		if current_target_index < target_positions.size():
			var target_position = target_positions[current_target_index]
			direction = (target_position - global_position).normalized()
			if global_position.distance_to(target_position) < 1:
				global_position = target_position
				current_target_index += 1
		else:
			if Global.ending == true and Global.mission_complite == true:
				Global.dialogue_name = "mision_success2"
				walk_out = false
			elif Global.ending == true and Global.mission_complite == false:
				Global.dialogue_name = "mision_fail2"
			walk_out = false
			direction = Vector2.ZERO
