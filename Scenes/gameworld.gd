extends Node2D

@onready var player: Player = $Player
@export_file var starting_horse

@onready var screen_fade: ColorRect = $UI/Control/ScreenFade

var reloading := false

func _ready() -> void:
	if Global.spawn_loc == Vector2.ZERO:
		Global.spawn_loc = player.global_position
	
	#player.died.connect(reload)
	player.global_position = Global.spawn_loc
	var h_l = load(starting_horse)
	var h = h_l.instantiate()
	add_child(h)
	h.global_position = player.global_position + Vector2(0,64)
	
	var t := get_tree().create_tween()
	t.tween_property(screen_fade,"modulate:a", 0, 0.5)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("reset"):
		reload()

func reload():
	#print(is_inside_tree())
	if reloading: return
	reloading = true
	
	var t := get_tree().create_tween()
	t.tween_property(screen_fade,"modulate:a", 2, 0.3)
	await t.finished
	Global.onoff=false
	#while true:
	if player.get_tree():
		player.get_tree().reload_current_scene()


func change_to_level(path):
	if reloading: return
	reloading = true
	
	var t := get_tree().create_tween()
	t.tween_property(screen_fade,"modulate:a", 2, 0.3)
	await t.finished
	Global.onoff=false
	Global.spawn_loc = Vector2.ZERO
	#while true:
	if player.get_tree():
		player.get_tree().change_scene_to_file(path)
