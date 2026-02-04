extends ScrollContainer

@export var row_scene: PackedScene
@export var title_row_scene: PackedScene
@onready var table_container: VBoxContainer = $TableView

func _ready() -> void:
	load_locations()
	
func clear_table():
	if table_container.get_children():
		for child in table_container.get_children():
			child.queue_free()
			
func load_locations():
	clear_table()
	
	var row_title_node = title_row_scene.instantiate()
	var bd_columns = get_table_columns("locations")
	row_title_node.set_column_name(bd_columns)
	table_container.add_child(row_title_node)
	
	var query_result = []
	
	#var rows = Database.db.select_rows("persons", "age = 40", ["id", "first_name"])
	var rows = Database.db.query("SELECT * FROM locations")
	
	if not rows:
		return
		
	query_result = Database.db.query_result
	
	if query_result.size() == 0:
		print('No records found. Please check your query')
		return
		
	for row in query_result:
		var id = row["id"]
		var city = row["city"]
		var state = row["state"]

		var dict = {"id" : id, "city" : city, "state" : state}
		
		var row_node = row_scene.instantiate()
		row_node.set_data(dict)
		table_container.add_child(row_node)
		
func get_table_columns(table_name: String) -> Array:
	var columns := []
	var result = Database.db.query("PRAGMA table_info(%s);" % table_name)
	
	if result:
		for row in Database.db.query_result:
			columns.append(row["name"])
	return columns
