extends RemoveNoChildren
class_name CircleShot
const BOSS_BULLET = preload("res://Objects/boss_bullet.tscn")

@export var num : int = 24
@export var vel := Vector2(300,0)

func _ready() -> void:
	for i in num:
		var b = BOSS_BULLET.instantiate()
		add_child(b)
		b.velocity = vel
		b.rotation_degrees = (360/num) * i
