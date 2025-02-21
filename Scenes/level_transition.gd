extends Control

@export_file() var next_level

@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("trans")
	await  animation_player.animation_finished
	get_tree().change_scene_to_file(next_level)
