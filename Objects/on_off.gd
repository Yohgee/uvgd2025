extends StaticBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var timer: Timer = $Timer

var active = true

func _ready() -> void:
	update_gfx(Global.onoff)
	Global.on_off_changed.connect(update_gfx)

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if !active: return
	active = false
	Global.toggle_onoff()
	timer.start(0.3)

func update_gfx(val):
	if val:
		sprite_2d.frame = 0
	else:
		sprite_2d.frame = 1


func _on_timer_timeout() -> void:
	active = true
