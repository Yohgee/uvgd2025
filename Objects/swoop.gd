extends BossAttack

@onready var boss: Boss = $"../.."

var orpos : Vector2
@onready var tone: AudioStreamPlayer = $Tone

func attack():
	boss.wavin = false
	orpos = boss.position
	var tween = get_tree().create_tween()
	tone.play()
	tween.set_parallel()
	tween.tween_property(boss, "position", Vector2(1360,176), 0.8)
	tween.tween_property(boss, "position:x", 2000,2).set_delay(0.8)
	tween.tween_property(boss, "position:y", 384,1).set_delay(0.8).set_ease(Tween.EASE_OUT)
	tween.tween_property(boss, "position:y", 176,1).set_delay(0.8+1).set_ease(Tween.EASE_IN)
	tween.tween_property(boss, "position", orpos,0.5).set_delay(2.8)
	await tween.finished
	boss.wavin = true
	attack_done.emit()
