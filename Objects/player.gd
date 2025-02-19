extends CharacterBody2D
class_name Player

const DISMOUNT_VEL = -360

@onready var physics_component: PhysicsComponent = $PhysicsComponent
@onready var movement_component: MovementComponent = $MovementComponent
@onready var jump_component: JumpComponent = $JumpComponent
@onready var sprite_2d: Sprite2D = $Sprite2D

var horse : Horse = null

signal died

func _physics_process(delta: float) -> void:
	
	if !horse:
		physics_component.process_physics(delta)
		if !is_on_floor():
			movement_component.process_movement(delta)
			jump_component.process_jump(delta)
		if movement_component.cspeed > 0:
			sprite_2d.flip_h = false
		elif movement_component.cspeed != 0:
			sprite_2d.flip_h = true
	else:
		handle_horse(delta)
	
	move_and_slide()
	movement_component.cspeed = 0
	
	if global_position.y > 800:
		hurt(null)

func handle_horse(delta):
	self.global_position = horse.rider_offset.global_position
	velocity = horse.velocity
	horse.movement_component.process_movement(delta)
	if !horse.is_on_floor():
			horse.jump_component.process_jump(delta)
	sprite_2d.flip_h = horse.sprite_2d.flip_h
	if Input.is_action_just_pressed("horse"):
		horse.horse_action.action()
	
	if Input.is_action_just_pressed("jump"):
		velocity = horse.velocity
		horse = null
		velocity.y = DISMOUNT_VEL

func hurt(_body : Node2D):
	died.emit()
