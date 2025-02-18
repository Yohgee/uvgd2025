extends CharacterBody2D
class_name Horse

@onready var physics_component: PhysicsComponent = $PhysicsComponent
@onready var rider_offset: Node2D = $RiderOffset
@onready var movement_component: MovementComponent = $MovementComponent
@onready var jump_component: JumpComponent = $JumpComponent

@export var horse_action : HorseAction

func _physics_process(delta: float) -> void:
	
	physics_component.process_physics(delta)
	
	move_and_slide()
	movement_component.cspeed = 0


func _on_saddle_body_entered(body: Node2D) -> void:
	if body is not Player: return
	
	body = body as Player
	
	if body.velocity.y <= 0: return
	
	velocity = body.velocity
	body.velocity = Vector2.ZERO
	body.horse = self
	
