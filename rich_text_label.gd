extends RichTextLabel

func _ready() -> void:
	var manual = FileAccess.open("res://Player Guid.txt", FileAccess.READ)
	self.text = manual.get_as_text()
	manual.close()
