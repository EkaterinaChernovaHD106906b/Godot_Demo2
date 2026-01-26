extends Control

@export var label_id: Label
@export var label_first_name: Label
@export var label_last_name: Label
@export var label_age: Label
@export var label_occupation: Label
@export var label_location_id: Label
@export var container: HBoxContainer

func set_data(data: Dictionary) -> void:
	label_id.text = str(data["id"]) + " "
	label_first_name.text = data["first_name"] + " "
	label_last_name.text = data["last_name"] + " "
	label_age.text = str(data["age"]) + " "
	label_occupation.text = data["occupation"] + " "
	label_location_id.text = str(data["location_id"]) + " "
	
func set_column_name(names: Array) -> void:
	var labels := container.get_children()
	var bold_font := load("res://Taminaru-Regular.otf")
	for label in labels:
		label.add_theme_font_override("font", bold_font)
		label.add_theme_font_size_override("font_size", 15)
		label.add_theme_color_override("font_color", Color.BLACK)

	label_id.text = names[0] + " "
	label_first_name.text = names[1].replace("_", " ") + " "
	label_last_name.text = names[2].replace("_", " ") + " "
	label_age.text = names[3] + " "
	label_occupation.text = names[4] + " "
	label_location_id.text = names[5].replace("_", " ") + " "
	
	
	
