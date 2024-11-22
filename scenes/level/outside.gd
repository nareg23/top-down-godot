extends LevelParent

func _on_gate_player_entered_gate(body: CharacterBody2D) -> void:
	if 'speed' in body:
		print('player entered')
		var tween = create_tween()
		tween.tween_property(body,'speed',0,0.5).from(200)
		TransitionLayer.change_scene('res://scenes/level/inside.tscn')
	


func _on_house_player_entered() -> void:
	var	player = $player/Camera2D
	var tween = create_tween()
	tween.tween_property(player,'zoom',Vector2(0.7,0.7),0.5)
	
	pass # Replace with function body.


func _on_house_player_exited() -> void:
	var	player = $player/Camera2D
	var tween = create_tween()
	tween.tween_property(player,'zoom',Vector2(0.6,0.6),0.5)
