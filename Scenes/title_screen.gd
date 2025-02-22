extends Control

@onready var click: AudioStreamPlayer = $HBoxContainer/HSlider/Click


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/intro.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)
	click.play()
