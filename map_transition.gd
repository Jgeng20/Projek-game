extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer
@onready var MapStart = $MapStart
@onready var MapNodeA = $MapNodeA
@onready var MapNodeB = $MapNodeB
@onready var MapNodeC = $MapNodeC
@onready var MapNodeD = $MapNodeD
@onready var MapNodeE = $MapNodeE
@onready var MapNodeF = $MapNodeF
@onready var MapNodeG = $MapNodeG


func _ready():
	var posisi = Vector2(1024, 108)
	var scale = Vector2(0.12, 0.126)
	color_rect.visible = false
	
	MapStart.visible = false
	MapStart.position = posisi
	MapStart.scale = scale
	
	MapNodeA.visible = false
	MapNodeA.position = posisi
	MapNodeA.scale = scale
	
	MapNodeB.visible = false
	MapNodeB.position = posisi
	MapNodeB.scale = scale
	
	MapNodeC.visible = false
	MapNodeC.position = posisi
	MapNodeC.scale = scale
	
	MapNodeD.visible = false
	MapNodeD.position = posisi
	MapNodeD.scale = scale
	
	MapNodeE.visible = false
	MapNodeE.position = posisi
	MapNodeE.scale = scale
	
	MapNodeF.visible = false
	MapNodeF.position = posisi
	MapNodeF.scale = scale
	
	MapNodeG.visible = false
	MapNodeG.position = posisi
	MapNodeG.scale = scale
	animation_player.animation_finished.connect(_on_animation_finished)

func _process(delta):
	pass

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		animation_player.play("fade_to_white")
	elif anim_name == "fade_to_white":
		color_rect.visible =false

func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")
