extends Button

@export var text_input: TextEdit
@export var left_panel: ScrollContainer
@export var clear_result_button: Button
@export var click_button_sound: AudioStreamPlayer2D
@export var msg_sound: AudioStreamPlayer2D


func _on_pressed() -> void:
	click_button_sound.play()
	if text_input.text.strip_edges() != "":
		QueryValue.last_query = text_input.text
		left_panel.load_persons()
		clear_result_button.visible = true
	else:
		msg_sound.play()
		var notif = preload("res://notification.tscn").instantiate()
		get_tree().current_scene.add_child(notif)
		notif.show_notification("Enter the query")
	
