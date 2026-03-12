extends Label

var lines: Array[String]  = ["Hi there, player. Weird choice of game.", "You’re about to play a database simulator.", "I don't know much about databases,", "considering I'm a mouse.", "But maybe you'll enjoy diving into a world", "where everything follows strict rules."]
var speed = 3
var speed2 = 0.1
var stop_typing: bool = false
var typing: bool = false

@export var dialog_panel: Panel

func _ready() -> void:
	pass
	#type_text()
		
func type_text():
	if typing:
		return
	typing = true
	stop_typing = false
	visible = true
	
	var i = 0

	while i < len(lines):
		if stop_typing:
			typing = false
			return
		visible_characters = 0
		text = lines[i]
		for j in lines[i].length():
			if stop_typing:
				typing = false
				return
				
			visible_characters += 1
			await get_tree().create_timer(speed2).timeout
		await get_tree().create_timer(speed).timeout
		
		if stop_typing:
			typing = false
			return
			
		i += 1
	typing = false
	dialog_panel.visible = false
	visible = false
			
func hide_dialog():
	typing = false
	stop_typing = true
	dialog_panel.visible = false
	visible = false

	
