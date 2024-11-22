extends Area2D

@export var speed:int = 500;
var direction:Vector2 = Vector2.UP;
var is_light:bool = false;


func _ready() -> void:
	$SelfDestructTimer.start()
	var light:PointLight2D = $PointLight2D;
	$AnimationPlayer.play('new_laser')
	if is_light:
		light.enabled = true

func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	#check if method/prop exists.
	if 'hit' in body: 
		body.hit()
		queue_free()
	


func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
