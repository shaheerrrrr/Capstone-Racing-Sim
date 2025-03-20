extends Node3D

@onready var boostpad = $Boost_Pad
@onready var player = $PLayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (boostpad.has_overlapping_bodies):
		player.speed = player.ENGINE_POWER*1.2
		await get_tree().create_timer(1.5).timeout
		player.speed *= (5/6)
