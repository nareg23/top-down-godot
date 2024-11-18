extends CanvasLayer

@onready var laser_label:Label = %LaserLabel
@onready var laser_texture:TextureRect = %LaserLogo
@onready var grenade_texture:TextureRect = $GrenadeCounter/VBoxContainer/GrenadeLogo
@onready var grenade_label:Label = %GrenadeLabel
@onready var health_progress_bar:TextureProgressBar = $HealthBard/MarginContainer/TextureProgressBar;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#	Global signals
	Globals.connect('grenade_change',update_grenade_text)
	Globals.connect('laser_change',update_laser_text)
	Globals.connect('health_change',update_health)
	
	update_health()
	laser_label.text = str(Globals.laser_amount)
	grenade_label.text = str(Globals.grenade_amount)
	
	update_color(Globals.laser_amount,laser_label,laser_texture)
	update_color(Globals.grenade_amount,grenade_label,grenade_texture)
	pass # Replace with function body.

func update_laser_text():
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount,laser_label,laser_texture)
	pass


func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount,grenade_label,grenade_texture)
	pass

func update_color(amount:int,label:Label,icon:TextureRect) -> void :
	if amount < 10:
		label.self_modulate = Color.YELLOW
	if amount <  5:
		label.self_modulate = Color.RED
	pass
	
func update_health() -> void:
	health_progress_bar.value = Globals.health
	
	
