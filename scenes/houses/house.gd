extends Area2D
signal player_entered
signal player_exited
var isLoading = false;

func _on_body_entered(_body: Node2D) -> void:
	print('has entered')
	if !isLoading:
		$Timer.start()
	isLoading = true;
	player_entered.emit()
	pass # Replace with function body.


func _on_body_exited(_body: Node2D) -> void:
	print('has exited')
	if !isLoading:
		$Timer.start()
	isLoading = true
	player_exited.emit()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	$Lights/SimpleLight2.toggleLight()
	isLoading = false;
	pass # Replace with function body.
