extends CharacterBody2D

var direction = Vector2.RIGHT
var speed = 150
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()



func hit():
	print('hit')