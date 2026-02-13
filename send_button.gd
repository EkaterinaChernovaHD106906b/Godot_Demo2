extends Button

@export var msg_sound: AudioStreamPlayer2D
@export var click_button_sound: AudioStreamPlayer2D

func _on_pressed() -> void:
	click_button_sound.play()
	msg_sound.play()
	var notif = preload("res://notification.tscn").instantiate()
	get_tree().current_scene.add_child(notif)
	notif.show_notification("New Case Uploaded")
	
