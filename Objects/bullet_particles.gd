extends GPUParticles2D
@onready var bounce_sfx: AudioStreamPlayer = $BounceSFX

func _ready() -> void:
	emitting = true
	bounce_sfx.play()

func _on_finished() -> void:
	self.queue_free()
