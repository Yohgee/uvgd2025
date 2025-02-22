extends Area2D
class_name BossTrigger


@onready var player := get_tree().get_first_node_in_group("player") as Player
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

signal boss_triggered

func _on_body_entered(body: Node2D) -> void:
	if body is not Player: return
	body = body as Player
	
	collision_shape_2d.set_deferred("disabled", true)
	
	body.camera_2d.limit_left = global_position.x
	body.dead = true
	body.velocity = Vector2.ZERO
	if body.horse:
		body.horse.velocity = Vector2.ZERO
	boss_triggered.emit()
