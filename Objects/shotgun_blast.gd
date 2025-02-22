extends RemoveNoChildren


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var p := get_tree().get_first_node_in_group("player") as Player
	look_at(p.position)
