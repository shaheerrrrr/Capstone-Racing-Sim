extends VehicleBody3D

const MAX_STEER = 0.8
const ENGINE_POWER = 300


@onready var camera_pivot = $CameraPivot
@onready var camera_3d = $CameraPivot/Camera
@onready var reverse_camera = $CameraPivot/ReverseCamera



var look_at

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	look_at = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	steering = move_toward(steering, Input.get_axis("move_right", "move_left") * MAX_STEER, delta * 2.5)
	engine_force = Input.get_axis("move_forward", "move_backwards") * ENGINE_POWER
	camera_pivot.global_position = camera_pivot.global_position.lerp(global_position, delta * 20.0)
	camera_pivot.transform = camera_pivot.transform.interpolate_with(transform, delta * 5.0)
	look_at = look_at.lerp(global_position + linear_velocity, delta * 5.0)
	#camera_3d.look_at(look_at)
	#reverse_camera.look_at(look_at)
	_check_camera_switch()
	if Input.is_action_just_pressed("flip_vehicle"):
		_flip_vehicle()
	
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
	return up_vector.dot(Vector3(0, 1, 0)) < 0.0
