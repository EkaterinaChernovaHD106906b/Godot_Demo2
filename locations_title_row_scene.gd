extends Control

@export var label_id: Label
@export var label_city: Label
@export var label_state: Label

func set_column_name(names: Array) -> void:
	label_id.text = names[0] 
	label_city.text = names[1]
	label_state.text = names[2]
	
