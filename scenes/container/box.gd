extends ItemContainer


func hit():
	print('this is from the BOX')
	var selected_position:Vector2 = $SpawnPoints.get_child(randi() % $SpawnPoints.get_child_count()).global_position
	open.emit(selected_position,facing_direction)
	$TopSprite.visible =  false
