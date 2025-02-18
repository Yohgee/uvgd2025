extends Node
class_name JumpComponent

@onready var physics_component: PhysicsComponent = $"../PhysicsComponent"
@onready var parent := get_parent() as CharacterBody2D

@export var initial_vel := -400
@export var action = "jump"
@export var floatiness := 2.0

var def_grav

func _ready() -> void:
	def_grav = physics_component.gravity

func process_jump(_delta):
	if parent.velocity.y <= 0 and Input.is_action_pressed(action):
		physics_component. gravity = def_grav/floatiness
	else:
		physics_component.gravity = def_grav
