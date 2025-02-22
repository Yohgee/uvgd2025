extends BossAttack
class_name ShootAttack

@export_file var things : Array[String]
@export var delay : float = 0.8
@export var repeat : int = 1

@onready var l = get_tree().get_first_node_in_group("level")

func attack():
	for i in repeat:
		for np in things:
			var thing = load(np)
			thing = thing.instantiate() as Node2D
			thing.global_position = global_position
			l.add_child(thing)
			
			await  get_tree().create_timer(delay).timeout
	attack_done.emit()
