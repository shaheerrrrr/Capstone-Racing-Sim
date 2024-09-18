extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# load your image.
	var image = load("res://assets/vehicles/mk8standard/internal_ground_ao_texture.jpeg")
	# Get the 3D model
	var mesh = get_node("MeshInstance")
	# Get the material in slot 0
	var material_one = mesh.get_surface_material(0)
	# Change the texture
	material_one.albedo_texture = image
	# Reassign the material
	mesh.set_surface_material(0, material_one)

 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
