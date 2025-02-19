extends Node
class_name MovementComponent

@onready var parent := get_parent() as CharacterBody2D

@export var dspeed := 380*4
@export var max_speed := 380.0

var cspeed := 0.0

func process_movement(delta):
	var dir := Input.get_axis("left", "right")
	cspeed = dspeed * dir * delta
	if parent.velocity.x * dir < 0 and !parent.is_on_floor():
		cspeed *= 2
		
	parent.velocity.x = clamp(parent.velocity.x + cspeed, -max_speed, max_speed)
	
