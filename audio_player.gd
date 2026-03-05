extends Node

@onready var player = $AudioStreamPlayer
	
func play_click_sound():
	player.play()
