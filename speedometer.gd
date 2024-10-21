extends Label

var speed : float
@onready var player = $"Player"

func _ready():
	text = "0 mph"

func _physics_process(delta: float) -> void:
	speed = player._getSpeed()
	
	text = str(int(speed)) + "km/h"
	$Speedometer.text = text
