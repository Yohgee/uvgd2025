extends HorseAction

@onready var horse := get_parent() as Horse
@onready var jump_component: JumpComponent = $"../JumpComponent"
@onready var jumphorse_sfx: AudioStreamPlayer = $jumphorseSfx

func action():
	if horse.is_on_floor():
		horse.velocity.y = jump_component.initial_vel
		jumphorse_sfx.play()
