extends Button

@export var text_input: TextEdit
@export var left_panel: ScrollContainer

func _on_pressed() -> void:
	QueryValue.last_query = text_input.text
	left_panel.load_persons()
