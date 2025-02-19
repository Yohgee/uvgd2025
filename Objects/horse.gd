extends CharacterBody2D
class_name Horse

@onready var physics_component: PhysicsComponent = $PhysicsComponent
@onready var rider_offset: Node2D = $RiderOffset
@onready var movement_component: MovementComponent = $MovementComponent
@onready var jump_component: JumpComponent = $JumpComponent
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var horse_action : HorseAction

var run_timer := 0.0

func _physics_process(delta: float) -> void:
	
	physics_component.process_physics(delta)
	
	if movement_component.cspeed > 0:
		sprite_2d.flip_h = false
	elif movement_component.cspeed != 0:
		sprite_2d.flip_h = true
	
	if movement_component.cspeed != 0:
		if run_timer < 0:
			run_timer = 0.05
			sprite_2d.frame = wrapi(sprite_2d.frame + 1, 0, 2)
		else:
			run_timer -= delta
	else:
		sprite_2d.frame = 0
	
	move_and_slide()
	movement_component.cspeed = 0
	
	if global_position.y > 800:
		self.queue_free()


func _on_saddle_body_entered(body: Node2D) -> void:
	if body is not Player: return
	
	body = body as Player
	
	if body.velocity.y < 0: return
	
	velocity = body.velocity
	body.velocity = Vector2.ZERO
	body.horse = self
	
