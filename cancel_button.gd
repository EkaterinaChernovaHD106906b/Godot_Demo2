extends Button

@export var query_result_table: ScrollContainer
@export var click_button_sound: AudioStreamPlayer2D

func _on_pressed() -> void:
	click_button_sound.play()
	query_result_table.clear_table()
