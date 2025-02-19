extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func _on_timer_timeout() -> void:
	sprite_2d.offset.x = randf_range(-2.0, 2.0)
