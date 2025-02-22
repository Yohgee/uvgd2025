extends Area2D
class_name Boss

const POKEY = preload("res://Objects/pokey.tscn")
const BULLET_PARTICLES = preload("res://Objects/bullet_particles.tscn")

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attacks_node: Node2D = $Attacks
@onready var swoop: Node2D = $Attacks/Swoop

signal boss_defeated

var start_pos : Vector2

var attacks : Array[BossAttack] = []

var current_attack : BossAttack = null

var wavin = false
var sine_t : float = 0
var x_t : float = 0
var hp := 1
var invulnerable = true
var dead = false
var helper = 0

func _ready() -> void:
	for c in attacks_node.get_children():
		attacks.append(c as BossAttack)
		c.attack_done.connect(next_attack)

func start_boss(_v : Variant = null):
	start_pos = position
	sine_t = 0
	wavin = true
	invulnerable = false
	next_attack()

func _physics_process(delta: float) -> void:
	if wavin:
		sine_t += delta * 8
		wrapf(sine_t, 0, PI * 2)
		position.y = start_pos.y + sin(sine_t) * 16
		if hp <= 3:
			x_t += delta * 3
			wrapf(x_t, 0, PI * 2)
			position.x = start_pos.x + sin(x_t) * 64

func next_attack():
	if dead: return
	await get_tree().create_timer(1).timeout
	helper += 1
	var picked : BossAttack
	picked = attacks.pick_random()
	while picked == current_attack:
		picked = attacks.pick_random()
	current_attack = picked
	if helper >= 5:
		current_attack = swoop
	if current_attack == swoop:
		helper = 0
	current_attack.attack()

func _on_body_entered(body: Node2D) -> void:
	if body is not Player: return
	body = body as Player
	
	if invulnerable: return
	body.velocity.y = -300
	invulnerable = true
	hp -= 1
	if hp == 1:
		var p = POKEY.instantiate()
		p.set_deferred("height", 3)
		get_tree().get_first_node_in_group("level").call_deferred("add_child", p)
		p.global_position = start_pos - Vector2(300,0)
	if hp > 0:
		animation_player.play("hit_animation")
	else:
		dead = true
		hide()
		var parti = BULLET_PARTICLES.instantiate()
		parti.global_position = global_position
		get_tree().get_first_node_in_group("level").call_deferred("add_child", parti)
		boss_defeated.emit()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"hit_animation":
			invulnerable = false
