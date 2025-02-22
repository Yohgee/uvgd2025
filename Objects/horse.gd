extends CharacterBody2D
class_name Horse

@onready var physics_component: PhysicsComponent = $PhysicsComponent
@onready var rider_offset: Node2D = $RiderOffset
@onready var movement_component: MovementComponent = $MovementComponent
@onready var jump_component: JumpComponent = $JumpComponent
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var catch_sfx: AudioStreamPlayer = $Catch_sfx

@export var horse_action : HorseAction

var saddle_player : Player = null

var run_timer := 0.0
@export var active = true

func _physics_process(delta: float) -> void:
	if !active: return
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
	
	if saddle_player and saddle_player.velocity.y >= 0:
		if velocity.y < saddle_player.velocity.y:
			saddle_player.velocity.y = velocity.y
		velocity = saddle_player.velocity
		saddle_player.velocity = Vector2.ZERO
		saddle_player.horse = self
		saddle_player = null
		catch_sfx.play()
	
	move_and_slide()
	movement_component.cspeed = 0
	
	if global_position.y > 800:
		self.queue_free()


func _on_saddle_body_entered(body: Node2D) -> void:
	if body is not Player: return
	
	saddle_player = body as Player
	#
	#if body.velocity.y < 0: return
	#
	#if velocity.y < body.velocity.y:
		#body.velocity.y = velocity.y
	#velocity = body.velocity
	#body.velocity = Vector2.ZERO
	#body.horse = self
	#catch_sfx.play()
	


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	active = true


func _on_saddle_body_exited(body: Node2D) -> void:
	if body is not Player: return
	
	saddle_player = null
