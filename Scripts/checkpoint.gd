extends Area3D

var checkpointNum

func _ready():
	body_entered.connect(_on_body_entered)
	var name = $".".name
	checkpointNum = name.replace("Checkpoint", "")
func _process(delta):
	var x = 1

func _on_body_entered(body):
	#print("Body has pass checkpoint: ", body.name)
	if body.has_method("setCheckpoint"):
		body.setCheckpoint(int(checkpointNum))
	
