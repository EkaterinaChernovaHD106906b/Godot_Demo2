extends Control

@export var label_id: Label
@export var label_city: Label
@export var label_state: Label

func set_data(data: Dictionary) -> void:
	label_id.text = str(data["id"]) 
	label_city.text = data["city"]
	label_state.text = data["state"]
