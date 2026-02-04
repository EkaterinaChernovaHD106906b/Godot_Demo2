extends Control

@export var label_id: Label
@export var label_crime_type: Label
@export var label_crime_date: Label
@export var label_location_id: Label


func set_column_name(names: Array) -> void:
	label_id.text = names[0] 
	label_crime_type.text = names[1]
	label_crime_date.text = names[3]
	label_location_id.text = names[4]
