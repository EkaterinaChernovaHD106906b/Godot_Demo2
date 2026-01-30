extends Control

@export var label_id: Label
@export var label_first_name: Label
@export var label_last_name: Label
@export var label_age: Label
@export var label_occupation: Label
@export var label_location_id: Label
@export var container: HBoxContainer
@export var control: Control


func set_data(data: Dictionary) -> void:
	label_id.text = str(data["id"]) 
	label_first_name.text = data["first_name"]
	label_last_name.text = data["last_name"] 
	label_age.text = str(data["age"])
	label_occupation.text = data["occupation"]
	label_location_id.text = str(data["location_id"])
	


	
	
	
