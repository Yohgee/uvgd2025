extends Node

var spawn_loc : Vector2 = Vector2.ZERO

var onoff = false
signal on_off_changed(value)

func toggle_onoff():
	onoff = !onoff
	on_off_changed.emit(onoff)
