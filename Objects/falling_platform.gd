extends CharacterBody2D

@export var fall_gravity := 400.0 

var c_grav := 0

func _physics_process(delta: float) -> void:
	#velocity.y += c_grav * delta
	#velocity.y = clamp(velocity.y, 0, 400)
	
	position += velocity * delta


func _on_area_2d_body_entered(_body: Node2D) -> void:
	velocity.y = fall_gravity
