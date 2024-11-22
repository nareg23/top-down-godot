extends ItemContainer


func hit():
	print(is_open)
	if !is_open:
		for num in range(5):
			var selected_position:Vector2 = $SpawnPoints.get_child(randi() % $SpawnPoints.get_child_count()).global_position
			open.emit(selected_position,facing_direction)
	is_open = true;
	$TopSprite.visible =  false
