extends Button

@export var text_input: TextEdit
@export var left_panel: ScrollContainer
@export var clear_result_button: Button

func _on_pressed() -> void:
	QueryValue.last_query = text_input.text
	left_panel.load_persons()
	clear_result_button.visible = true
	
