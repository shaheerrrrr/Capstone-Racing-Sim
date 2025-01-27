extends Label

var time_elapsed := 0.0
var is_stopped := false
var started = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_backwards") or Input.is_action_just_pressed("move_forward") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		started = true
	if !is_stopped and started:
		time_elapsed += delta
		text = str(time_elapsed).pad_decimals(2)


func reset() -> void:
	time_elapsed = 0.0
	is_stopped = false

func stop() -> void:
	is_stopped = true
