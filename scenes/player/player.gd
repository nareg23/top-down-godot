extends CharacterBody2D

@export var speed:int = 500;
signal laser(pos,direction)
signal grenade(pos,direction)

var can_shoot = true
var can_grenade = true
const cooldown = 2;
@onready var particle_one:GPUParticles2D = $Particles/GPUParticles2D
@onready var particle_two:GPUParticles2D = $Particles/GPUParticles2D2
var isWalkingAnimationPlaying = false

func _process(_delta: float) -> void:
	var direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
	velocity = direction * speed;
	move_and_slide()
	var isWalking = direction != Vector2.ZERO
	look_at(get_global_mouse_position())
	Globals.player_position = global_position 
	primary_action()
	seconday_action()
	speed_boost()

	if isWalking:
		$AnimatedSprite2D.play('walk')
	elif  !isWalking and !$AnimatedSprite2D.is_playing():
		$AnimatedSprite2D.stop()
	pass


func seconday_action():
	if Input.is_action_pressed('secondary') and can_grenade and Globals.grenade_amount > 0:
		$GrenadeTimer.start()
		Globals.grenade_amount -= 1;
		var markers:Array[Node] = $GrenadeStartPositions.get_children();
		var random_marker:Marker2D = markers[randi() % markers.size()]
		var player_direction:Vector2 = (get_global_mouse_position() - position).normalized()
		grenade.emit(random_marker.global_position,player_direction)
		can_grenade = false;

func primary_action():
	if Input.is_action_pressed('primary') and can_shoot and Globals.laser_amount > 0:
		Globals.laser_amount -= 1;
		$AutoShootTimer.start()
		$AnimatedSprite2D.play("standing_fire")
		var markers:Array[Node] = $LaserStartPositions.get_children();
		var random_marker = markers[randi() % markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		can_shoot = false;
		
		particle_one.emitting = true
		particle_two.emitting = true
		laser.emit(random_marker.global_position,player_direction)

func speed_boost() -> void:
	if  Input.is_action_pressed('ui_accept'):
		speed = 800
	else:
		speed = 500
		

func _on_timer_timeout() -> void:
	can_shoot = true
	pass


func _on_grenade_timer_timeout() -> void:
	can_grenade = true
	pass # Replace with function body.


func hit():
	Globals.health -= 10;
