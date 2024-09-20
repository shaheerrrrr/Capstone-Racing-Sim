extends VehicleBody3D

const MAX_STEER = .8
const ENGINE_POWER = 500
var normal_friction_slip = 1.0
var drift_friction_slip = 0.8
var is_drifting = false

@onready var camera_pivot = $CameraPivot
@onready var camera_3d = $CameraPivot/Camera
@onready var reverse_camera = $CameraPivot/ReverseCamera
@onready var backRight_wheel = $"Back Right"
@onready var backLeft_wheel = $"Back Left"
@onready var frontRight_wheel = $"Front Right"
@onready var frontLeft_wheel = $"Front Left"


var look_at

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	look_at = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	steering = move_toward(steering, Input.get_axis("move_right", "move_left") * MAX_STEER, delta * 10 * 4)
	engine_force = Input.get_axis("move_forward", "move_backwards") * ENGINE_POWER
	camera_pivot.global_position = camera_pivot.global_position.lerp(global_position, delta * 20.0)
	camera_pivot.transform = camera_pivot.transform.interpolate_with(transform, delta * 5.0)
	look_at = look_at.lerp(global_position + linear_velocity, delta * 5.0)
	#camera_3d.look_at(look_at)
	#reverse_camera.look_at(look_at)
	_check_camera_switch()
	if Input.is_action_just_pressed("flip_vehicle"):
		_flip_vehicle()
	if Input.is_action_pressed("is_drifting"):
		_drift()
	else:
		_stop_drift()
	
	
func _drift():
	backLeft_wheel.wheel_friction_slip = drift_friction_slip
	backRight_wheel.wheel_friction_slip = drift_friction_slip
	#print("Drifting")
	
func _stop_drift():
	backLeft_wheel.wheel_friction_slip = normal_friction_slip
	backRight_wheel.wheel_friction_slip = normal_friction_slip
	#frontRight_wheel.wheel_friction_slip = normal_friction_slip
	#frontLeft_wheel.wheel_friction_slip = normal_friction_slip
	#print("Stop Drifting")
	
	

func _check_camera_switch():
	if Input.is_action_just_pressed("perspective_change"):
		if camera_3d.current == true:
			reverse_camera.current = true
		else:
			camera_3d.current = true
	
func _flip_vehicle():
	if is_upside_down():
		var transform = global_transform
		transform.origin.y += 1.5
		transform.basis = Basis()
		global_transform = transform

func is_upside_down() -> bool:
	var up_vector = global_transform.basis.y.normalized()
	return up_vector.dot(Vector3(0, 1, 0)) < 0.5
