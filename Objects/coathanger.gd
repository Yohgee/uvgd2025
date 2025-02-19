extends HorseAction

@onready var horse := get_parent() as Horse

func _physics_process(_delta: float) -> void:
	horse.velocity = Vector2.ZERO
