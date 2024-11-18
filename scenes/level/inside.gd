extends LevelParent 

func _on_exit_gate_body_entered(body: Node2D) -> void:
	if 'speed' in body:
		var tween = create_tween()
		tween.tween_property(body,'speed',0,0.5).from(500)
		TransitionLayer.change_scene('res://scenes/level/outside.tscn')
