extends Label
var speed : int

@onready var player = $"../Player"
func _ready():
	text = ""
	speed = 0
	
func _physics_process(delta: float) -> void:
	speed = player._getSpeed()
	
	text = str(speed) + "MPH"
