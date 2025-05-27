extends Label 

var time_elapsed := 0.0
var is_stopped := false
var started = false
var go = false
func _process(delta: float) -> void:
	time_elapsed += delta
	if (Input.is_action_just_pressed("move_backwards") or Input.is_action_just_pressed("move_forward") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right")) and go:
		started = true
	if !is_stopped and started:
		text = str(time_elapsed-3).pad_decimals(2)
	if time_elapsed > 3:
		go = true

func reset() -> void:
	time_elapsed = 0.0
	is_stopped = false

func stop() -> void:
	is_stopped = true
