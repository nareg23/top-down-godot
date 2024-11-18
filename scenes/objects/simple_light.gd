extends StaticBody2D


func toggleLight():
	var current_state = $PointLight2D.enabled
	$PointLight2D.enabled = !current_state
