extends Node2D

func _ready() -> void:
	var rows = Database.db.select_rows("persons", "age = 40", ["id", "first_name"])
	print(Database.db.query_result)
