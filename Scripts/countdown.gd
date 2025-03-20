extends Label

var time_elapsed := 0.0
var is_stopped := false

@onready var player = $"../Player"
func _process(delta: float) -> void:
	time_elapsed += delta
	if time_elapsed <= 3:
		text = str(4 - time_elapsed).pad_decimals(0)
	else:
		#resume()
		text = ""
		queue_free()

func reset() -> void:
	time_elapsed = 0.0
	is_stopped = false
	#pause() 

func stop() -> void:
	is_stopped = true

#
#func resume():
	#player.start()
