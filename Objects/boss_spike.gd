extends Node2D
class_name BossSpike

@export var id := 0
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	#activate()
	pass

func activate():
	animation_player.play("spike")
	animation_player.queue("RESET")
