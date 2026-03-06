extends TextureButton

func _on_pressed() -> void:
	GlobalAudioStreamPlayer.play_click_sound()
	if AudioStreamPlayerMusic.playing:
		AudioStreamPlayerMusic.stop()
		self.texture_normal = preload("res://green-play-button-icon-1-1.png")
	else:
		AudioStreamPlayerMusic.play()
		self.texture_normal = preload("res://stop-button-green-icon-1-1.png")
