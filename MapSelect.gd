extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Ensure mouse mode is set to visible

func _on_back_pressed() -> void:
	print("Back")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Ensure mouse is visible
	get_tree().change_scene_to_file("res://title_screen.tscn")

func _on_map_1_pressed() -> void:
	print("Map 1")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://TestScene.tscn")

func _on_map_2_pressed() -> void:
	print("Map2")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Ensure mouse is visible
	get_tree().change_scene_to_file("res://TestScene1.tscn")

func _on_map_3_pressed() -> void:
	print("Map3")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://DesertTrack.tscn")

func _on_map_4_pressed() -> void:
	print("Map4")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://RainbowRoad.tscn")
