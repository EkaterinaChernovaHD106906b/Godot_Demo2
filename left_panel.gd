extends ScrollContainer

@export var row_scene: PackedScene
@export var title_row_scene: PackedScene
@onready var table_container: VBoxContainer = $TableView

func _ready() -> void:
	#load_persons()
	pass
	
# Очищаем VBoxContainer
func clear_table():
	if table_container.get_children():
		for child in table_container.get_children():
			child.queue_free()
		
# Загружаем всех persons из БД
func load_persons():
	clear_table()
	
	var row_title_node = title_row_scene.instantiate()
	var bd_columns = get_table_columns("persons")
	row_title_node.set_column_name(bd_columns)
	table_container.add_child(row_title_node)
	
	var query_result = []
	
	#var rows = Database.db.select_rows("persons", "age = 40", ["id", "first_name"])
	var rows = Database.db.query("SELECT * FROM persons")
	
	if not rows:
		return
		
	query_result = Database.db.query_result
	print(query_result)
	
	if query_result.size() == 0:
		print("No rows returned")
		return
	
	for row in query_result:
		var id = row["id"]
		var first_name = row["first_name"]
		var last_name = row["last_name"]
		var age = row["age"]
		var occupation = row["occupation"]
		var location_id = row["location_id"]
		
		var dict = {"id" : id, "first_name" : first_name, "last_name" : last_name, "age" : age, "occupation" : occupation, "location_id" : location_id  }
		
		var row_node = row_scene.instantiate()
		row_node.set_data(dict)
		table_container.add_child(row_node)
	
func get_table_columns(table_name: String) -> Array:
	var columns := []
	var result = Database.db.query("PRAGMA table_info(%s);" % table_name)
	
	if result:
		for row in Database.db.query_result:
			columns.append(row["name"])
	print(columns)
	return columns
	

	
