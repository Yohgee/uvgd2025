extends CharacterBody2D

const POKEY_SEGMENT = preload("res://Objects/pokey_segment.tscn")
@onready var physics_component: PhysicsComponent = $PhysicsComponent
@onready var movement_component: FollowMovement = $MovementComponent

@export var speed : float = 100
@export var height : int = 4
@export var update_follow_range := 2.0

var active = false
var player : Player

func _ready() -> void:
	movement_component.max_speed = speed
	movement_component.update_follow_rate = update_follow_range
	for i in height:
		var ps = POKEY_SEGMENT.instantiate()
		add_child(ps)
		ps.position.y -= i * 30
		if i == height - 1:
			ps.sprite_2d.frame = 1
	
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	if !active : return
	physics_component.process_physics(delta)
	movement_component.process_movement(delta)
	move_and_slide()
	
	if global_position.y > 900:
		queue_free()
		pass


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	active = true
