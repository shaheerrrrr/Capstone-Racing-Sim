extends Label

var time_elapsed := 0.0
var counter = 1
var is_stopped := false

func _process(delta: float) -> void:
	time_elapsed += delta
	print(time_elapsed)
	if time_elapsed <= 3:
		#pause()
		text = str(4-time_elapsed).pad_decimals(0)
	else:
		resume()
		text = ""

func reset() -> void:
	time_elapsed = 0.0
	is_stopped = false
	

func stop() -> void:
	is_stopped = true

func pause():
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func resume():
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
