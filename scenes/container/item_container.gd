extends StaticBody2D

class_name ItemContainer
@onready var facing_direction:Vector2 = Vector2.DOWN.rotated(rotation)
signal open(pos,facing_direction)

func hit():
	print('Item Container hit')
	open.emit()
