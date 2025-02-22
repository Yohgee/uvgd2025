extends Area2D

@export var velocity : Vector2 = Vector2(300, 0)

func _physics_process(delta: float) -> void:
	position += velocity.rotated(rotation) * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
