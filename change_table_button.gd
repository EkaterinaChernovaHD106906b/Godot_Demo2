extends TextureButton

@export var tables: Array[ScrollContainer]
var current_index := 0

func _ready():
	_show_only(current_index)

func _on_pressed():
	current_index = (current_index + 1) % tables.size()
	_show_only(current_index)

func _show_only(index: int):
	for i in tables.size():
		tables[i].visible = (i == index)
	
	

	
