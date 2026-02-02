extends Control

@export var label_id: Label
@export var label_first_name: Label
@export var label_last_name: Label
@export var label_age: Label
@export var label_occupation: Label
@export var label_location_id: Label

func set_column_name(names: Array) -> void:
	label_id.text = names[0] 
	label_first_name.text = names[1]
	label_last_name.text = names[2]
	label_age.text = names[3]
	label_occupation.text = names[4]
	label_location_id.text = names[5]
