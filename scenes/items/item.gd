extends Area2D

const rotation_speed:int = 5;
const item_types = ['laser','laser','laser','grenade','health'];
var selected_item = item_types[randi() % len(item_types)]
var direction :Vector2
var distance:int = randi_range(150,250)

func _ready() -> void:
	if selected_item == 'laser':
		$Sprite2D.modulate = Color('085454');
	if selected_item == 'grenade':
		$Sprite2D.modulate = Color('0d2b01')
	if selected_item == 'health':
		$Sprite2D.modulate = Color('b96262')
		
	var tween = create_tween()
	var final_pos = position + direction * distance
	tween.tween_property(self,'position',final_pos,0.5)
	tween.set_parallel()
	tween.tween_property(self,'scale',Vector2(0.6,0.6),0.5).from(Vector2(0,0))

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
