extends Button

func _on_pressed() -> void:
	GlobalAudioStreamPlayer.play_click_sound()
	get_tree().quit()
