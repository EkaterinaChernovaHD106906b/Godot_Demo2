extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit_menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
