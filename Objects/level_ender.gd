extends Area2D

@export_file() var level_trans

func _ready() -> void:
	var p : Player = get_tree().get_first_node_in_group("player")
	p.camera_2d.limit_right = int(global_position.x)

func _on_body_entered(body: Node2D) -> void:
	if body is not Player: return
	var l = get_tree().get_first_node_in_group("level")
	l.change_to_level(level_trans)
