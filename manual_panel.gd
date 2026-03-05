extends Window

@export var manual_text: RichTextLabel

func _ready() -> void:
	var manual = FileAccess.open("res://Player Guid.txt", FileAccess.READ)
	manual_text.text = manual.get_as_text()
	manual.close()
	
func _on_close_requested() -> void:
	hide()
