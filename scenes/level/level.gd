extends Node2D
class_name LevelParent
var laser_scene:PackedScene = preload("res://scenes/projectiles/laser.tscn");
var grenade_scene:PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene:PackedScene = preload("res://scenes/items/item.tscn")
var scout_scene:PackedScene = preload('res://scenes/enemies/scout.tscn')

func _ready() -> void:
	for container in get_tree().get_nodes_in_group('Container'):
		container.connect('open',on_container_opened)
	for scout in get_tree().get_nodes_in_group('Scouts'):
		scout.connect('shoot',on_scout_shoot)
	pass


func on_container_opened(pos,facing_direction) -> void:
	var item = item_scene.instantiate()
	item.position += pos;
	item.direction = Vector2(1,1)
	$Items.call_deferred('add_child',item)
	
func on_scout_shoot(pos,dir):
	var laser = generate_laser(pos,dir)
	laser.speed = 500;
	print('scout shot')

func generate_laser(pos:Vector2,direction:Vector2) -> Area2D:
	var laser:Area2D = laser_scene.instantiate();
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	$Projectiles.add_child(laser)

	return laser
	

func _on_player_laser(pos:Vector2,direction:Vector2) -> void:
	var laser = generate_laser(pos,direction);
	var random_number = (randi() % 3)
	if random_number == 1:
		laser.is_light = true

func _on_player_grenade(pos:Vector2,player_direction:Vector2) -> void:
	var grenade:RigidBody2D = grenade_scene.instantiate()
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.speed
	$Projectiles.add_child(grenade)
