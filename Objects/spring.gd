extends Area2D

@export var springiness : Vector2 = Vector2(0,-700)
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var spring_sfx: AudioStreamPlayer = $SpringSFX

var active := true
var is_on_screen = false

func _on_body_entered(body: Node2D) -> void:
	if !active: return
	if body is CharacterBody2D:
		if springiness.x != 0: body.velocity.x = springiness.x
		if springiness.y != 0: body.velocity.y = springiness.y
		#active = false
		sprite_2d.frame = 1
		if is_on_screen:
			spring_sfx.play()
		#print(body.global_position)
		await get_tree().create_timer(0.3).timeout
		sprite_2d.frame = 0
		active = true


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	is_on_screen = true


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	is_on_screen = false
