extends Area2D

signal thigny

func activate():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position:y", position.y + 32*8, 2)
	thigny.emit()

func deactivate():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position:y", position.y - 32*8, 2)
