extends Label
var speed : int

@onready var player = get_node("Player/Vehicle")
func _ready():
	text = ""
	speed = 0
	
func _physics_process(delta: float) -> void:
	speed = player._getSpeed() * 1.75
	text = str(speed) + "MPH"
