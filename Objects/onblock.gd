extends StaticBody2D


@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	Global.on_off_changed.connect(switch)
	switch(Global.onoff)

func switch(state):
	if state:
		sprite_2d.frame = 0
		collision_shape_2d.set_deferred("disabled", false)
	else:
		sprite_2d.frame = 1
		collision_shape_2d.set_deferred("disabled", true)
