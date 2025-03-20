extends Area3D

signal race_finished

@export var victory_message: String = "Finish!"
@export var display_time: float = 3.0
@export var slow_down_rate: float = 0.95
@export var stopwatch_path: NodePath

@export var ui_label_path: NodePath

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
		print("Player detected at finish line!")
		
		_winning_vehicle = body
		
		if body.has_method("finish_race"):
			body.finish_race()
		
		_slowing_down = true
		
		# Stop the stopwatch timer
		if _stopwatch and _stopwatch.has_method("stop"):
			_stopwatch.stop()
			print("Stopwatch stopped at: ", _stopwatch.text)
		
		# Alternatively, if the timer is on the vehicle
		if body.has_node("timer") and body.get_node("timer").has_method("stop"):
			body.get_node("timer").stop()
			print("Vehicle timer stopped")
		
		if _ui_label:
			_ui_label.text = victory_message
			_ui_label.visible = true
		
		race_finished.emit()
		
		_timer.start()
		
		print("Finish line reached!")

func _on_timer_timeout():
	if _ui_label:
		_ui_label.visible = false
