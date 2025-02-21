extends HorseAction

@onready var horse := get_parent() as Horse
@onready var jump_component: JumpComponent = $"../JumpComponent"

func action():
	if horse.is_on_floor():
		horse.velocity.y = jump_component.initial_vel
