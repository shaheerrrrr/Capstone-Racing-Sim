extends Label

var time_elapsed := 0.0
var is_stopped := false
var started = false
var go = false
var starttime = 0

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("move_forward") || Input.is_action_just_pressed("move_backwards") || Input.is_action_just_pressed("move_left") || Input.is_action_just_pressed("move_right")) && go && not started:
		started = true
		starttime = time_elapsed
	if !is_stopped and started:
		text = str(time_elapsed-starttime).pad_decimals(2)
	time_elapsed += delta
	if time_elapsed > 3:
		go = true


func reset() -> void:
	time_elapsed = 0.0
	is_stopped = false

func stop() -> void:
	is_stopped = true
