extends Button

@export var msg_sound: AudioStreamPlayer2D
@export var click_button_sound: AudioStreamPlayer2D
@export var protocol: Button

func _on_pressed() -> void:
	click_button_sound.play()
	get_last_query_result()
	check_query_result()
	msg_sound.play()
	var notif = preload("res://notification.tscn").instantiate()
	get_tree().current_scene.add_child(notif)
	notif.show_notification("New Case Uploaded")
	
func get_last_query_result():
	var last_query: String = QueryValue.last_query
	var id: String
	var query_result = []
	var id_array = []
	
	Database.db.query(last_query)
	query_result = Database.db.query_result
	
	if query_result.size() == 0:
		print("No rows returned")
	else:
		for row in query_result:
			for key in query_result[0].keys():
				if key == 'id':
					id = str(row[key])
			if not id in id_array:
				id_array.append(id)
		return id_array
		
func check_query_result():
	var case_data = protocol.load_case_json("res://cases_data.json")
	var check: bool = case_data[QueryValue.load_id()]["query_result"] == get_last_query_result()
	print(case_data[QueryValue.load_id()]["query_result"])
	print(get_last_query_result())
	if check:
		if QueryValue.load_id() < 11:
			QueryValue.increment_id()

				
