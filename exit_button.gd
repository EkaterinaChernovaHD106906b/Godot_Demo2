extends Button

@export var click_button_sound: AudioStreamPlayer2D

func _on_pressed() -> void:
	click_button_sound.play()
	get_tree().change_scene_to_file("res://pcui.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
