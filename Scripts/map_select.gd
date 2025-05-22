extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Map1_button_pressed() -> void:
	print("Map 1")
	get_tree().change_scene_to_file("res://TestScene.tscn")

func _on_map_2_pressed() -> void:
	print("Back")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  
	get_tree().change_scene_to_file("res://title_screen.tscn")

func onMap2Pressed() -> void:
	print("Map2")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  
	get_tree().change_scene_to_file("res://TestScene1.tscn")
