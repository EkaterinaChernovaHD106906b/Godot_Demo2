extends Button

@export var msg_sound: AudioStreamPlayer2D
@export var click_button_sound: AudioStreamPlayer2D
@export var protocol: Button

func _on_pressed() -> void:
	click_button_sound.play()
	get_last_query_result()
	check_query_result()

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
	var query_result: Array
	var case_data = protocol.load_case_json("res://cases_data.json")
	var expected_result = case_data[QueryValue.load_id()]["query_result"].duplicate()
	if get_last_query_result():
		query_result = get_last_query_result().duplicate()
	expected_result.sort()
	query_result.sort()
	var check: bool = expected_result == query_result
	#var check: bool = case_data[QueryValue.load_id()]["query_result"] == get_last_query_result()
	if check:
		if QueryValue.load_id() < 11:
			QueryValue.increment_id()
			msg_sound.play()
			var notif = preload("res://notification.tscn").instantiate()
			get_tree().current_scene.add_child(notif)
			notif.show_notification("New Case Uploaded")
		else:
			msg_sound.play()
			var notif = preload("res://notification.tscn").instantiate()
			get_tree().current_scene.add_child(notif)
			notif.show_notification("You've completed all the tasks")
	else:
		msg_sound.play()
		var error_notif = preload("res://error_notification.tscn").instantiate()
		get_tree().current_scene.add_child(error_notif)
		error_notif.show_notification("Verify the request parameters")
