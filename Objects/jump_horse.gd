extends HorseAction

@onready var horse := get_parent() as Horse
@onready var jump_component: JumpComponent = $"../JumpComponent"

func action():
	if horse.is_on_floor():
		horse.velocity.y = jump_component.initial_vel
		horse.move_and_collide(horse.velocity * horse.get_process_delta_time())
		horse.move_and_collide(horse.velocity * horse.get_process_delta_time())
		horse.move_and_collide(horse.velocity * horse.get_process_delta_time())
		horse.move_and_collide(horse.velocity * horse.get_process_delta_time())
