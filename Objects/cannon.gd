extends StaticBody2D

@export_file() var shoot_path = "res://Objects/bullet.tscn"
@export var time : float = 1.5
@export var offset : Vector2 = Vector2(-36,0)
@export var shoot_vel : Vector2

@onready var shoot := load(shoot_path)
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.wait_time = time


func _on_timer_timeout() -> void:
	var sp : Node2D = shoot.instantiate()
	var l = get_tree().get_first_node_in_group("level")
	l.add_child(sp)
	if shoot_vel != Vector2.ZERO:
		sp.set("velocity", shoot_vel)
	sp.global_position = global_position + offset


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	timer.start()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	timer.stop()
