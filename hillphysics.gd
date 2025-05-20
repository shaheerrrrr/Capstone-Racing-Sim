extends Area3D

var checkpointNum: int

func _ready():
	body_entered.connect(_on_body_entered)
	var name = self.name
	checkpointNum = int(name.replace("Checkpoint", ""))

func _process(delta):
	pass  # Remove unnecessary code

func _on_body_entered(body):
	if body.has_method("setCheckpoint"):
		body.setCheckpoint(checkpointNum)
		if body is RigidBody3D:
			body.mass = 150
