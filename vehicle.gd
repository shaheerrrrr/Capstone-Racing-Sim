extends VehicleBody3D

# Constants and variables
const MAX_STEER = 0.4
const ENGINE_POWER = 1000  # Increased for better acceleration
var normal_friction_slip = 1.0
var backwheeldrift = 0.85  # Adjusted for better grip during drifts
var frontwheeldrift = 0.9  # Adjusted for better grip during drifts
var target_back_friction = normal_friction_slip
var target_front_friction = normal_friction_slip
var speed = 0
var finished = false
var start = false
@onready var camera_pivot = $CameraPivot
@onready var camera_3d = $CameraPivot/Camera
@onready var reverse_camera = $CameraPivot/ReverseCamera
@onready var backLeft_wheel = $"Back Left"
@onready var frontRight_wheel = $"Front Right"
@onready var backRight_wheel = $"Back Right"
@onready var frontLeft_wheel = $"Front Left"
@onready var timer = $timer
var time_elapsed := 0.0

var look_at
var gear_ratios = [3.5, 2.5, 1.8, 1.2, 1.0]
var current_gear = 0

# Initialize the vehicle
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	look_at = global_position
	# Adjust suspension properties for better handling
	for wheel in [backLeft_wheel, backRight_wheel, frontLeft_wheel, frontRight_wheel]:
		wheel.suspension_stiffness = 50
		wheel.damping_relaxation = 0.5   # Typical values for a normal car

# Handle physics updates
func _physics_process(delta: float) -> void:
	if start:
		# Improved steering with sensitivity curve
		var steer_input = Input.get_axis("move_right", "move_left")
		var steer_target = steer_input * MAX_STEER * (1 - abs(steer_input) * 0.5)
		steering = move_toward(steering, steer_target, delta * 20 * 4)

		# Simple gear system based on speed
		speed = linear_velocity.length()
		if speed < 5:
			current_gear = 0
		elif speed < 10:
			current_gear = 1
		elif speed < 15:
			current_gear = 2
		elif speed < 20:
			current_gear = 3
		else:
			current_gear = 4
		engine_force = Input.get_axis("move_forward", "move_backwards") * ENGINE_POWER * gear_ratios[current_gear]

		# Braking
		if Input.is_action_pressed("brake"):
			brake = 1000
		else:
			brake = 0

	# Camera and other existing logic
	camera_pivot.global_position = camera_pivot.global_position.lerp(global_position, delta * 20.0)
	camera_pivot.transform = camera_pivot.transform.interpolate_with(transform, delta * 5.0)
	look_at = look_at.lerp(global_position + linear_velocity, delta * 5.0)
	_check_camera_switch()
	if Input.is_action_just_pressed("flip_vehicle"):
		_flip_vehicle()
	if Input.is_action_pressed("is_drifting"):
		_drift()
	else:
		_stop_drift()

	# Smoothly interpolate wheel friction towards target values
	backLeft_wheel.wheel_friction_slip = lerp(backLeft_wheel.wheel_friction_slip, target_back_friction, delta * 10)
	backRight_wheel.wheel_friction_slip = lerp(backRight_wheel.wheel_friction_slip, target_back_friction, delta * 10)
	frontLeft_wheel.wheel_friction_slip = lerp(frontLeft_wheel.wheel_friction_slip, target_front_friction, delta * 10)
	frontRight_wheel.wheel_friction_slip = lerp(frontRight_wheel.wheel_friction_slip, target_front_friction, delta * 10)

	# Apply surface friction (implement is_on_grass() based on your terrain)
	var surface_friction = 1.0 if not is_on_grass() else 0.7
	for wheel in [backLeft_wheel, backRight_wheel, frontLeft_wheel, frontRight_wheel]:
		wheel.wheel_friction_slip *= surface_friction

	# Anti-roll torque to reduce body roll
	var anti_roll_torque = -angular_velocity.z * 1000
	apply_torque(Vector3(0, 0, anti_roll_torque))

	time_elapsed += delta
	if time_elapsed > 3:
		start = true

# Drift handling
func _drift():
	target_back_friction = backwheeldrift
	target_front_friction = frontwheeldrift

func _stop_drift():
	target_back_friction = normal_friction_slip
	target_front_friction = normal_friction_slip

# Camera switching
func _check_camera_switch():
	if Input.is_action_just_pressed("perspective_change"):
		if camera_3d.current == true:
			reverse_camera.current = true
		else:
			camera_3d.current = true

# Vehicle flipping
func _flip_vehicle():
	if is_upside_down():
		var transform = global_transform
		transform.origin.y += 1.5
		transform.basis = Basis()
		global_transform = transform

func is_upside_down() -> bool:
	var up_vector = global_transform.basis.y.normalized()
	return up_vector.dot(Vector3(0, 1, 0)) < 0.5

# Surface detection (placeholder)
func is_on_grass() -> bool:
	return false  # Implement this function based on your terrain

# Finish line detection
func _on_Player_body_entered(body):
	var bodyName = body.getName()
	if bodyName == "Finishline":
		finished = true
		print("Finished!!!")

# Get the vehicle's speed
func _getSpeed() -> float:
	return linear_velocity.length()
