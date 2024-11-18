extends RigidBody2D

var speed = 500;


func explode():
	$Sprite2D.visible = false;
	$Explosion.visible = true;
	$AnimationPlayer.play('Explosion')
