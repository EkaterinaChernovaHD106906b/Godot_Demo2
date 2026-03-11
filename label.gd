extends Label

var lines: Array[String]  = ["Hi there, player. Weird choice of game.", "You’re about to play a database simulator.", "I don't know much about databases,", "considering I'm a mouse.", "But maybe you'll enjoy diving into a world", "where everything follows strict rules."]
var speed = 3
var speed2 = 0.1
var stop_typing: bool = false

@export var dialog_panel: Panel

func _ready() -> void:
	pass
	#type_text()
		
func type_text():
	visible = true
	#stop_typing = false
	var i = 0
	if !stop_typing:
		while i < len(lines):
			visible_characters = 0
			text = lines[i]
			for j in lines[i].length():
				visible_characters += 1
				await get_tree().create_timer(speed2).timeout
			await get_tree().create_timer(speed).timeout
			i += 1
			
func hide_dialog():
	stop_typing = true
	dialog_panel.visible = false
	visible = false

	
