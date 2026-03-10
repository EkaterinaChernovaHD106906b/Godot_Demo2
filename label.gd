extends Label

var text_to_show = "Hi, I'm a mouse"
var speed = 0.3

func _ready() -> void:
	text = text_to_show
	visible_characters = 0
	type_text()
	
func type_text():
		for i in text.length():
			visible_characters += 1
			await get_tree().create_timer(speed).timeout
			
