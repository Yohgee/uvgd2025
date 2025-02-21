extends HorseAction
class_name HorseShoot

@export_file var shoot_path = "res://Objects/bullet.tscn"
@export var speed : Vector2 = Vector2(340,0)
@export var offset : Vector2 = Vector2(68,0)
@export var cooldown : float = 0.6

@onready var horse := get_parent() as Horse
@onready var shoot := load(shoot_path) as PackedScene
var t = 0


func _process(delta: float) -> void:
	if t <= 0: return
	t -= delta

func action():
	if t > 0: return
	t = cooldown
	
	var shot : Node2D = shoot.instantiate()
	var dir = 1
	if horse.sprite_2d.flip_h:
		dir = -1
	var sv = Vector2(speed.x * dir, speed.y)
	var os = Vector2(offset.x * dir, offset.y)
	
	var l = get_tree().get_first_node_in_group("level")
	l.add_child(shot)
	shot.global_position = horse.global_position + os
	if speed != Vector2.ZERO:
		shot.set("velocity", sv)
	
	
