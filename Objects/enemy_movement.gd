extends MovementComponent
class_name FollowMovement

@export var update_follow_rate : float = 2.0

var t : float = 0

func process_movement(delta):
	if !parent.is_on_floor(): return
	if parent.is_on_wall():
		cspeed *= -1
	parent.velocity.x = max_speed * cspeed
	if t < 0:
		t = update_follow_rate
		update_follow(parent.player)
	else:
		t -= delta


func update_follow(target : Node2D):
	cspeed = target.global_position.x - parent.global_position.x 
	cspeed /= abs(cspeed)
