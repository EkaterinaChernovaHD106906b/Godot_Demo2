extends Control

@export var label_id: Label
@export var crime_type: Label
@export var crime_date: Label
@export var location_id: Label


func set_column_name(names: Array) -> void:
	label_id.text = names[0] 
	crime_type.text = names[1]
	crime_date.text = names[3]
	location_id.text = names[4]
