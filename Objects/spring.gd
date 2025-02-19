extends Area2D

@export var springiness : Vector2 = Vector2(0,-700)
@onready var sprite_2d: Sprite2D = $Sprite2D

var active := true

func _on_body_entered(body: Node2D) -> void:
	if !active: return
	if body is CharacterBody2D:
		if springiness.x != 0: body.velocity.x = springiness.x
		if springiness.y != 0: body.velocity.y = springiness.y
		#active = false
		sprite_2d.frame = 1
		#print(body.global_position)
		await get_tree().create_timer(0.3).timeout
		sprite_2d.frame = 0
		active = true
