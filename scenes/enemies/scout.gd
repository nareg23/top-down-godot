extends CharacterBody2D

var player_nearby = false;
var can_shoot = true
var speed = 300;
var health = 30;
var is_vulnerable = true
signal shoot(pos,direction)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#velocity = direction * speed * delta
	#position += velocity
	if player_nearby:
		look_at(Globals.player_position)
		position  += (Globals.player_position - position).normalized() * speed * delta 
		if can_shoot:
			var pos:Vector2 = $LaserPositions.get_child((randi() % 2)).global_position
			var direction = (Globals.player_position - position).normalized()
			shoot.emit(pos,direction)
			can_shoot = false
			$Timers/LaserCooldown.start()
	pass


func _on_attack_range_body_entered(_body: Node2D) -> void:
	player_nearby = true;
	pass # Replace with function body.


func _on_attack_range_body_exited(_body: Node2D) -> void:
	player_nearby = false;
	pass # Replace with function body.


func _on_laser_cooldown_timeout() -> void:
	can_shoot = true
	pass # Replace with function body.

func hit():
	
	if is_vulnerable:
		health -= 10;
		is_vulnerable = false;
		$Timers/InvulnerableTimer.start()
		$Sprite2D.material.set_shader_parameter('progress',1);
	
	if  health <= 0:
		queue_free()
		
		


func _on_invulnerable_timer_timeout() -> void:
	is_vulnerable = true;
	$Sprite2D.material.set_shader_parameter('progress',0);
	pass # Replace with function body.
