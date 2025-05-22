extends Area3D

signal race_finished
signal lap_count_changed(new_count: int)

@export var victory_message: String = "Finish!"
@export var display_time: float = 3.0
@export var slow_down_rate: float = 0.95
@export var stopwatch_path: NodePath
@export var ui_label_path: NodePath
@export var forward_direction: Vector3 = Vector3.FORWARD

var _ui_label = null
var _timer = null
var _winning_vehicle = null
var _slowing_down = false
var _stopwatch = null

func _ready():
	print("Finish line ready! Waiting for player...")
	
	body_entered.connect(_on_body_entered)
	
	_timer = Timer.new()
	_timer.one_shot = true
	_timer.wait_time = display_time
	_timer.timeout.connect(_on_timer_timeout)
	add_child(_timer)
	
	if ui_label_path:
		_ui_label = get_node(ui_label_path)
		
	if stopwatch_path:
		_stopwatch = get_node(stopwatch_path)

func _process(delta):
	if _slowing_down and is_instance_valid(_winning_vehicle):
		_winning_vehicle.engine_force *= slow_down_rate
		_winning_vehicle.brake = 4

func _on_body_entered(body):
	print("Body entered finish line: ", body.name)
	
	if body.is_in_group("player") or body is VehicleBody3D:
		var velocity_direction = body.linear_velocity.normalized()
		var global_forward = global_transform.basis * forward_direction
		var dot_product = velocity_direction.dot(global_forward)
		
		if dot_product > 0.5:
			print("Player detected at finish line - correct direction!")
			if body.has_method("add_lap"):
				body.add_lap()
				lap_count_changed.emit(body.get_current_lap())
				
				if body.has_method("get_current_lap") and body.has_method("get_total_laps"):
					var current_lap = body.get_current_lap()
					var total_laps = body.get_total_laps()
					
					if current_lap >= total_laps:
						print("Race completed!")
						_winning_vehicle = body
						
						if body.has_method("finish_race"):
							body.finish_race()
						
						_slowing_down = true
						
						if _stopwatch and _stopwatch.has_method("stop"):
							_stopwatch.stop()
							print("Stopwatch stopped at: ", _stopwatch.text)
						
						if body.has_node("timer") and body.get_node("timer").has_method("stop"):
							body.get_node("timer").stop()
							print("Vehicle timer stopped")
						
						if _ui_label:
							_ui_label.text = victory_message
							_ui_label.visible = true
						
						race_finished.emit()
						_timer.start()
		else:
			print("Player detected at finish line - wrong direction!")
			if body.has_method("subtract_lap"):
				body.subtract_lap()
				lap_count_changed.emit(body.get_current_lap())

func _on_timer_timeout():
	if _ui_label:
		_ui_label.visible = false
