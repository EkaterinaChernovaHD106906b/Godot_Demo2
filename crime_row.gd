extends Control

@export var label_id: Label
@export var label_crime_type: Label
@export var label_crime_date: Label
@export var label_location_id: Label

func set_data(data: Dictionary) -> void:
	label_id.text = str(data["id"]) 
	label_crime_type.text = data["crime_type"]
	label_crime_date.text = data["crime_date"]
	label_location_id.text = str(data["location_id"])
