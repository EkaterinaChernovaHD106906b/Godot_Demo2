extends Button

@onready var manual_panel = get_tree().current_scene.get_node("Root").get_node("ProtocolPanel")
@export var protocol: Panel
@export var click_button_sound: AudioStreamPlayer2D

func _pressed() -> void:
	click_button_sound.play()
	set_protocol_text(0)
	manual_panel.visible = true
	
func load_case_json(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Cannot open file:"  + path)
		return {}
		
	var text = file.get_as_text()
	file.close()
	
	var json := JSON.new()
	var result = json.parse(text)
	if result != OK:
		push_error("Failed to parse JSON: %s" %json.get_error_message())
		return {}
		
	return json.data
	
func set_protocol_text(index: int):
	var case_data = load_case_json("res://cases_data.json")
	var label = protocol.get_node("VBoxContainer").get_node("MarginContainer3").get_node("Summary")
	var label2 = protocol.get_node("VBoxContainer").get_node("MarginContainer").get_node("CaseId")
	var label3 = protocol.get_node("VBoxContainer").get_node("MarginContainer2").get_node("Location")
	label.text = case_data[index]["summary"]
	label2.text = case_data[index]["case_id"]
	label3.text = case_data[index]["location"]
	
