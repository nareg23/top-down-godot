extends ItemContainer


func hit():
	$TopSprite.hide()
	if not is_open:
		for i in range(3):
			var markers =  $SpawnPoints.get_children()
			var  choser_marker_pos = markers[(randi() % markers.size())].global_position
			open.emit(choser_marker_pos,facing_direction)
	is_open = true
