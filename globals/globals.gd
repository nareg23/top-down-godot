extends Node
signal health_change
signal laser_change
signal grenade_change

var laser_amount = 20:
	set(value):
		laser_amount = value
		laser_change.emit()
		
var grenade_amount = 5:
	set(value):
		grenade_amount = value
		grenade_change.emit()

var is_vulnerable:bool = true
var health = 70:
	set(value):
		var is_demage = value > 0;
		if is_demage and  not is_vulnerable: return;
		is_vulnerable = false;
		player_vulnerable_timer()
		health = min(value,100)
		health_change.emit()
	
func player_vulnerable_timer():
	await get_tree().create_timer(0.5).timeout
	is_vulnerable = true;
	
		
var player_position:Vector2
