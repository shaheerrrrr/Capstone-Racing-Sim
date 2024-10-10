#extends Label
#
#var speed : float
#
#@onready var car = $"../Player"
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#text = "0 mph"
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#speed = car.speed
	#speed *= 10
	#text = str(int(speed)) + "mph"
