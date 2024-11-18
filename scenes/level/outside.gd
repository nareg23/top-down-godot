extends LevelParent

func _on_gate_player_entered_gate(body: CharacterBody2D) -> void:
	if 'speed' in body:
		print('player entered')
		var tween = create_tween()
		tween.tween_property(body,'speed',0,0.5).from(200)
		TransitionLayer.change_scene('res://scenes/level/inside.tscn')
	
