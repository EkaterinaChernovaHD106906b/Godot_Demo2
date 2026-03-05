extends Button

func _on_pressed() -> void:
	GlobalAudioStreamPlayer.play_click_sound()
	get_tree().change_scene_to_file("res://pcui.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
