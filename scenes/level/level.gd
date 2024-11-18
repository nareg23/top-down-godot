extends Node2D
class_name LevelParent
var laser_scene:PackedScene = preload("res://scenes/projectiles/laser.tscn");
var grenade_scene:PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _ready() -> void:
	for container in get_tree().get_nodes_in_group('Container'):
		container.connect('open',on_container_opened)
	pass

func on_container_opened(pos,facing_direction) -> void:
	print('hellozzzz from container_open')
	


func _on_player_laser(pos:Vector2,direction:Vector2) -> void:
	var laser:Area2D = laser_scene.instantiate();
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	$UI.update_laser_text()
	var random_number = (randi() % 3)
	if random_number == 1:
		laser.is_light = true
	$Projectiles.add_child(laser)

func _on_player_grenade(pos:Vector2,player_direction:Vector2) -> void:
	var grenade:RigidBody2D = grenade_scene.instantiate()
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()



func _on_house_player_entered() -> void:
	var tween = create_tween()
	tween.parallel()
	#tween.tween_property($player/Camera2D,"zoom",Vector2(1,1),1)
	#tween.tween_property($player/Camera2D,"zoom",Vector2(1,1),1)



func _on_house_player_exited() -> void:
	var tween = create_tween()
	tween.tween_property($player/Camera2D,"zoom",Vector2(0.6,0.6),2)
	
