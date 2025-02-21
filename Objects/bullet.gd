extends Area2D

@export var velocity : Vector2 = Vector2(-180, 0)
@export var bounce : float = 400
const BULLET_PARTICLES = preload("res://Objects/bullet_particles.tscn")
@onready var sprite_2d: Sprite2D = $Sprite2D

var active = false

func _physics_process(delta: float) -> void:
	if !active: return
	if velocity.x > 0:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false
	position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.velocity.y < -10:
			body.hurt(null)
			return
	
	if body is CharacterBody2D:
		if body.velocity.y > -10:
			body.velocity.y = -bounce
		else:
			var p : Player = get_tree().get_first_node_in_group("player")
			if p.horse == body:
				p.hurt(null)
	
	var l = get_tree().get_first_node_in_group("level")
	var pa = BULLET_PARTICLES.instantiate()
	l.add_child(pa)
	pa.global_position = self.global_position
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	active = true
