extends Area2D

const rotation_speed:int = 5;
const item_types = ['laser','laser','laser','grenade','health'];
var selected_item = item_types[randi() % len(item_types)]


func _ready() -> void:
	if selected_item == 'laser':
		$Sprite2D.modulate = Color('085454');
	if selected_item == 'grenade':
		$Sprite2D.modulate = Color('0d2b01')
	if selected_item == 'health':
		$Sprite2D.modulate = Color('b96262')

func _process(delta) -> void:
	rotation += rotation_speed * delta


func _on_body_entered(_body: Node2D) -> void:
	if selected_item == 'laser':
		Globals.laser_amount += 5;
	if selected_item == 'grenade':
		Globals.grenade_amount += 5;
	if selected_item == 'health':
		Globals.health += 25;
	queue_free()
	pass # Replace with function body.
