extends BossAttack
class_name BossSpikeAttack

@export var spikes : Array[Array]
@export var delay : float = 0.8
@export var ceiling := false

@onready var spike_nodes = get_tree().get_nodes_in_group("spikes")
@onready var ceiling_node = get_tree().get_first_node_in_group("ceiling")

func attack():
	if ceiling:
		ceiling_node.activate()
		await get_tree().create_timer(2-delay).timeout
	if spikes.size() == 0:
		spikes.append(range(0,23))
	for s in spikes:
		await get_tree().create_timer(delay).timeout
		for n in spike_nodes:
			if n is BossSpike:
				if s.has(n.id):
					n.activate()
	await get_tree().create_timer(delay).timeout
	if ceiling:
		ceiling_node.deactivate()
	attack_done.emit()
