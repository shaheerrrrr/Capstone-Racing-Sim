extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _1stPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand <.325): # 32.5% chance for a green shell
		return "Green Shell"
	elif (rand < .700): # 37.5% chance for a banana
		return "Banana"
	elif (rand < .850): # 15% chance for a fake item box (may be removed from game)
		return "Fake Item Box"
	elif (rand < .990): # 14% chance for a triple banana
		return "Triple Banana"
	else: # 1% chance for a mushroom
		return "Mushroom"
	
	

func _2ndPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand <.175): # 17.5% chance for a green shell
		return "Green Shell"
	elif (rand < .375): # 25% chance for a red shell
		return "Red Shell"
	elif (rand < .452): # 37.5% chance for a banana
		return "Banana"
	elif (rand < .525): # 5% chance for a fake item box (may be removed from game)
		return "Fake Item Box"
	elif (rand < .700): # 10% chance for a mushroom
		return "Mushroom"
	elif (rand < .725): # 14% chance for a triple mushroom
		return "Triple Mushroom"
	elif (rand < .750):
		return "Bobomb"
	else: # 1% chance for a mushroom
		return "Mushroom"
	

func _3rdPlaceBoxRoulette() -> String:
	
	

func _4thPlaceBoxRoulette() -> String:
	
	

func _5thPlaceBoxRoulette() -> String:
	
	

func _6thPlaceBoxRoulette() -> String:
	
	

func _7thPlaceBoxRoulette() -> String:
	
	

func _8thPlaceBoxRoulette() -> String:
	
	

func _9thPlaceBoxRoulette() -> String:
	
	

func _10thPlaceBoxRoulette() -> String:
	
	

func _11thPlaceBoxRoulette() -> String:
	
	

func _12thPlaceBoxRoulette() -> String:
	
	
