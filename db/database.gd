extends Node

var db : SQLite
var db_path := "user://case01.db"

func _ready() -> void:
	_ensure_db_exists()
	_open_db()
	
func _ensure_db_exists():
	if FileAccess.file_exists(db_path):
		return
	print("Copying database to user://")
	
	var src = FileAccess.open("res://data/case01.db", FileAccess.READ)
	var dst = FileAccess.open(db_path, FileAccess.WRITE)
	
	dst.store_buffer(src.get_buffer(src.get_length()))
	src.close()
	dst.close()
	
func _open_db():
	db = SQLite.new()
	db.path = db_path
	db.open_db()
	print("Database opened:", db_path)
