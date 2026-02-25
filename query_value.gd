extends Node

var last_query: String = ""

func save_id(case_id: int):
	var file = FileAccess.open("user://save.dat",FileAccess.WRITE)
	file.store_32(case_id)
	file.close()
	
func load_id() -> int:
	if not FileAccess.file_exists("user://save.dat"):
		save_id(0)
		return 0
	var file = FileAccess.open("user://save.dat", FileAccess.READ)
	var case_id = file.get_32()
	file.close()
	return case_id
	
func increment_id():
	var id: int = load_id()
	var updated_id: int
	updated_id = id + 1
	save_id(updated_id)
