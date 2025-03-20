extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Ensure mouse mode is set to visible

func _on_start_button_pressed() -> void:
	print("start pressed")
	get_tree().change_scene_to_file("res://MapSelect.tscn")

func _on_quit_button_pressed() -> void:
	print("quit pressed")
	get_tree().quit()
