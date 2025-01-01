extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO

@onready var animation_tree = $AnimationTree
@onready var pause_menu = $CanvasLayer1

func _physics_process(_delta):
	player_movement()

func player():
	pass

func player_movement():
	if Global.in_dialogue == true:
		velocity = direction * 20
		move()
	elif TransitionScreen.color_rect.visible == true :
		direction = Global.transition_way
		velocity = direction * 50
	elif Global.in_dialogue == false and Global.ending == false:
		direction = Input.get_vector("left","right","up","down")
		velocity = direction * 100

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

var target_positions
var current_target_index = 0

func move():
	if Global.to_orang2 == true:
		if Global.ending == true:
			target_positions = [Vector2(320, 240), Vector2(380, 240)]
		else:
			target_positions = [Vector2(294, 260), Vector2(295, 260)]
		if current_target_index < target_positions.size():
			var target_position = target_positions[current_target_index]
			direction = (target_position - global_position).normalized()
			if global_position.distance_to(target_position) < 1:
				global_position = target_position
				current_target_index += 1
			
			
		else:
			Global.to_orang2 = false
			Dialogic.start(Global.dialogue_name)
			direction = Vector2.ZERO

	elif Global.to_orang1 == true:
		target_positions = [Vector2(229, 183), Vector2(229, 182)]
		if current_target_index < target_positions.size():
			var target_position = target_positions[current_target_index]
			direction = (target_position - global_position).normalized()
			if global_position.distance_to(target_position) < 1:
				global_position = target_position
				current_target_index += 1
		else:
			Global.to_orang1 = false
			Dialogic.start(Global.dialogue_name)
			direction = Vector2.ZERO
