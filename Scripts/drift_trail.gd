extends Node3D

var trail_mesh: MeshInstance3D
var trail_material: StandardMaterial3D
var trail_points: Array[Vector3] = []
var max_points: int = 50
var fade_time: float = 2.0
var current_time: float = 0.0

func _ready():
	# Create material for the trail
	trail_material = StandardMaterial3D.new()
	trail_material.albedo_color = Color(0, 0, 0, 0.8)  # Black color with transparency
	trail_material.emission_enabled = true
	trail_material.emission = Color(0, 0, 0)  # Black emission
	trail_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	
	# Create mesh for the trail
	var mesh = ImmediateMesh.new()
	trail_mesh = MeshInstance3D.new()
	trail_mesh.mesh = mesh
	trail_mesh.material_override = trail_material
	add_child(trail_mesh)

func _process(delta):
	current_time += delta
	
	# Remove old points
	while trail_points.size() > max_points:
		trail_points.pop_front()
	
	# Update trail mesh
	var mesh = trail_mesh.mesh as ImmediateMesh
	mesh.clear_surfaces()
	mesh.surface_begin(Mesh.PRIMITIVE_TRIANGLE_STRIP)
	
	for i in range(trail_points.size()):
		var point = trail_points[i]
		var next_point = trail_points[i + 1] if i < trail_points.size() - 1 else point
		
		# Calculate direction vector
		var direction = (next_point - point).normalized()
		var perpendicular = direction.cross(Vector3.UP).normalized()
		
		# Calculate width based on position in trail
		var width = (1.0 - float(i) / max_points) * .5
		
		# Add vertices for trail strip
		mesh.surface_add_vertex(point + perpendicular * width)
		mesh.surface_add_vertex(point - perpendicular * width)
	
	mesh.surface_end()
	
	# Fade out trail
	if trail_points.size() > 0:
		var alpha = 1.0 - (current_time / fade_time)
		if alpha <= 0:
			queue_free()
		else:
			trail_material.albedo_color.a = alpha

func add_point(point: Vector3):
	trail_points.append(point)
