extends Node
class_name PhysicsComponent

@onready var movement_component: MovementComponent = $"../MovementComponent"

@onready var parent := get_parent() as CharacterBody2D
@export var gravity := 980+320
@export var friction := 0.6

func process_physics(delta):
	parent.velocity.y += gravity * delta
	if parent.is_on_floor() and movement_component.cspeed * parent.velocity.x <= 0:
		parent.velocity.x *= friction
