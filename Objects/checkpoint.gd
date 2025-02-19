extends Area2D

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var sprite_2d: Sprite2D = $Sprite2D

var t := 0.0

func _process(delta: float) -> void:
	if t <= 0:
		t = 0.2
		sprite_2d.frame = wrapi(sprite_2d.frame + 1, 0, 2)
	else:
		t -= delta


func _on_body_entered(body: Node2D) -> void:
	if body is not Player: return
	
	if Global.spawn_loc == global_position + Vector2(0,-64): return
	
	Global.spawn_loc = global_position + Vector2(0,-64)
	gpu_particles_2d.emitting = true
