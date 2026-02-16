extends TextureButton

func _pressed() -> void:
	get_tree().change_scene_to_file("res://db.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
