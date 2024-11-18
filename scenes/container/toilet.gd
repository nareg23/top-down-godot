extends ItemContainer


func hit():
	$TopSprite.hide()
	var markers =  $SpawnPoints.get_children()
	var  choser_marker_pos = markers[(randi() % markers.size())].global_position
	open.emit(choser_marker_pos,facing_direction)
#	signal to  level
