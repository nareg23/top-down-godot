extends RigidBody2D
signal explode_demage
var explosion_active:bool = false;
var explosion_radius:int = 300;
var speed = 300;


func explode():
	$Sprite2D.visible = false;
	$Explosion.visible = true;
	$AnimationPlayer.play('Explosion')
	explosion_active = true
	
	

func _process(delta: float) -> void:
	if explosion_active:
		var targets = get_tree().get_nodes_in_group('Container') + get_tree().get_nodes_in_group('Entities')
		for target in targets:
			var in_range = global_position.distance_to(target.global_position) < explosion_radius
			if 'hit' in target and in_range:
				target.hit()
