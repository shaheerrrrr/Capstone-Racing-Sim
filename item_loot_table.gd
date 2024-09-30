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
	elif (rand < .425): # 25% chance for a red shell
		return "Red Shell"
	elif (rand < .625): # 20% chance for a banana
		return "Banana"
	elif (rand < .700): # 7.5% chance for a fake item box (may be removed from game)
		return "Fake Item Box"
	elif (rand < .825): # 12.5% chance for a mushroom
		return "Mushroom"
	elif (rand < .875): # 5% chance for a triple green shells
		return "Triple Green Shells"
	else: # 15% chance for a triple banana
		return "Triple Banana"
	

func _3rdPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand <.150): # 15% chance for a green shell
		return "Green Shell"
	elif (rand < .400): # 25% chance for a red shell
		return "Red Shell"
	elif (rand < .475): # 7.5% chance for a banana
		return "Banana"
	elif (rand < .525): # 5% chance for a fake item box (may be removed later)
		return "Fake Item Box"
	elif (rand < .700): # 17.5% chance for a mushroom
		return "Mushroom"
	elif (rand < .725): # 2.5% chance for a bobomb
		return "Bobomb"
	elif (rand < .750): # 2.5% chance for a thundercloud
		return "Thundercloud"
	elif (rand < .850): # 10% chance for a triple green shells
		return "Triple Green Shells"
	elif (rand < .900): # 5% chance for a triple red shells
		return "Triple Red Shells"
	else: # 10% chance for a triple banana
		return "Triple Banana"
	

func _4thPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand <.075): # 7.5% chance for a green shell
		return "Green Shell"
	elif (rand < .275): # 20% chance for a red shell
		return "Red Shell"
	elif (rand < .300): # 2.5% chance for a banana
		return "Banana"
	elif (rand < .325): # 2.5% chance for a fake item box (may be removed later)
		return "Fake Item Box"
	elif (rand < .550): # 22.5% chance for a mushroom
		return "Mushroom"
	elif (rand < .600): # 5% chance for a triple mushroom
		return "Triple Mushroom"
	elif (rand < .650): # 5% chance for a bobomb
		return "Bobomb"
	elif (rand < .675): # 2.5% chance for a blue shell
		return "Blue Shell"
	elif (rand < .700): # 2.5% chance for a mega mushroom
		return "Mega Mushroom"
	elif (rand < .775): # 7.5% chance for a thundercloud
		return "Thundercloud"
	elif (rand < .875): # 10% chance for a triple green shells
		return "Triple Green Shells"
	elif (rand < .975): # 10% chance for a triple red shells
		return "Triple Red Shells"
	else: # 2.5% chance for a triple banana
		return "Triple Banana"
	

func _5thPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand <.050): # 5% chance for a green shell
		return "Green Shell"
	elif (rand < .200): # 20% chance for a red shell
		return "Red Shell"
	elif (rand < .350): # 15% chance for a mushroom
		return "Mushroom"
	elif (rand < .450): # 10% chance for a triple mushroom
		return "Triple Mushroom"
	elif (rand < .525): # 7.5% chance for a bobomb
		return "Bobomb"
	elif (rand < .575): # 5% chance for a blue shell
		return "Blue Shell"
	elif (rand < .650): # 7.5% chance for a mega mushroom
		return "Mega Mushroom"
	elif (rand < .700): # 7.5% chance for a milker (renamed blooper)
		return "Blooper"
	elif (rand < .775): # 7.5% chance for a triple green shells
		return "Thundercloud"
	elif (rand < .875): # 12.5% chance for a thundercloud
		return "Triple Green Shells"
	elif (rand < .975): # 10% chance for a triple red shells
		return "Triple Red Shells"
	else: # 2.5% chance for a triple banana
		return "Triple Banana"
	

func _6thPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand <.100): # 10% chance for a green shell
		return "Red Shell"
	elif (rand < .225): # 12.5% chance for a mushroom
		return "Mushroom"
	elif (rand < .375): # 15% chance for a triple mushroom
		return "Triple Mushroom"
	elif (rand < .450): # 7.5% chance for a bobomb
		return "Bobomb"
	elif (rand < .525): # 7.5% chance for a blue shell
		return "Blue Shell"
	elif (rand < .575): # 5% chance for a golden mushroom
		return "Golden Mushroom"
	elif (rand < .675): # 10% chance for a mega mushroom
		return "Mega Mushroom"
	elif (rand < .750): # 7.5% chance for a milker (renamed blooper)
		return "Blooper"
	elif (rand < .825): # 7.5% chance for a thundercloud
		return "Thundercloud"
	elif (rand < .900): # 7.5% chance for a triple green shells
		return "Triple Green Shells"
	elif (rand < .975): # 7.5% chance for a triple red shells
		return "Triple Red Shells"
	else: # 2.5% chance for a triple banana
		return "Triple Banana"
	

func _7thPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand <.050): # 5% chance for a green shell
		return "Red Shell"
	elif (rand < .150): # 10% chance for a mushroom
		return "Mushroom"
	elif (rand < .400): # 25% chance for a triple mushroom
		return "Triple Mushroom"
	elif (rand < .450): # 5% chance for a bobomb
		return "Bobomb"
	elif (rand < .525): # 7.5% chance for a blue shell
		return "Blue Shell"
	elif (rand < .625): # 10% chance for a golden mushroom
		return "Golden Mushroom"
	elif (rand < .725): # 10% chance for a mega mushroom
		return "Mega Mushroom"
	elif (rand < .800): # 7.5% chance for a milker (renamed blooper)
		return "Blooper"
	elif (rand < .875): # 7.5% chance for a thundercloud
		return "Thundercloud"
	elif (rand < .925): # 5% chance for a triple green shells
		return "Triple Green Shells"
	else: # 7.5% chance for a triple red shells
		return "Triple Red Shells"
	

func _8thPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand <.025): # 2.5% chance for a green shell
		return "Red Shell"
	elif (rand < .350): # 32.5% chance for a triple mushroom
		return "Triple Mushroom"
	elif (rand < .400): # 5% chance for a blue shell
		return "Blue Shell"
	elif (rand < .525): # 12.5% chance for a star
		return "Star"
	elif (rand < .750): # 22.5% chance for a golden mushroom
		return "Golden Mushroom"
	elif (rand < .850): # 10% chance for a mega mushroom
		return "Mega Mushroom"
	elif (rand < .900): # 5% chance for a milker (renamed blooper)
		return "Blooper"
	elif (rand < .950): # 7.5% chance for a thundercloud
		return "Thundercloud"
	else: # 5% chance for a triple red shells
		return "Triple Red Shells"
	

func _9thPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand < .375): # 37.5% chance for a triple mushroom
		return "Triple Mushroom"
	elif (rand < .400): # 2.5% chance for a blue shell
		return "Blue Shell"
	elif (rand < .600): # 20% chance for a star
		return "Star"
	elif (rand < .875): # 27.5% chance for a golden mushroom
		return "Golden Mushroom"
	elif (rand < .925): # 5% chance for a mega mushroom
		return "Mega Mushroom"
	elif (rand < .975): # 5% chance for a milker (renamed blooper)
		return "Blooper"
	else: # 5% chance for a bullet bill
		return "Bullet Bill"
	

func _10thPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand < .300): # 30% chance for a triple mushroom
		return "Triple Mushroom"
	elif (rand < .575): # 27.5% chance for a star
		return "Star"
	elif (rand < .925): # 35% chance for a golden mushroom
		return "Golden Mushroom"
	else: # 7.5% chance for a bullet bill
		return "Bullet Bill"
	

func _11thPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand < .125): # 12.5% chance for a triple mushroom
		return "Triple Mushroom"
	elif (rand < .200): # 7.5% chance for a lightning
		return "Lightning"
	elif (rand < .475): # 27.5% chance for a star
		return "Star"
	elif (rand < .775): # 30% chance for a golden mushroom
		return "Golden Mushroom"
	else: # 22.5% chance for a bullet bill
		return "Bullet Bill"
	

func _12thPlaceBoxRoulette() -> String:
	var rand = randf()
	if (rand < .050): # 5% chance for a triple mushroom
		return "Triple Mushroom"
	elif (rand < .250): # 20% chance for a lightning
		return "Lightning"
	elif (rand < .425): # 17.5% chance for a star
		return "Star"
	elif (rand < .650): # 22.5% chance for a golden mushroom
		return "Golden Mushroom"
	else: # 35% chance for a bullet bill
		return "Bullet Bill"
	
