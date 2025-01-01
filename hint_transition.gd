extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer
@onready var hint = $Label
@onready var hint_ = $Label2


func _ready():
	hint.visible = false
	hint_.visible = false
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _process(delta):
	if Global.hint_visible == true:
		hint.visible = true
		hint_.visible = true

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		animation_player.play("fade_to_white")
	elif anim_name == "fade_to_white":
		color_rect.visible =false

func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")
