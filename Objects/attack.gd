extends Node2D
class_name BossAttack

signal attack_done

func attack():
	attack_done.emit()
