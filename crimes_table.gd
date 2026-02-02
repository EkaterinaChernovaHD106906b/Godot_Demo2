extends ScrollContainer

@export var row_scene: PackedScene
@onready var table_container: VBoxContainer = $TableView
@export var left_panel: ScrollContainer

func _ready() -> void:
	load_persons()
	
func clear_table():
	if table_container.get_children():
		for child in table_container.get_children():
			child.queue_free()
			
func load_persons():
	clear_table()
	
	#var row_title_node = title_row_scene.instantiate()
	var bd_columns = get_table_columns("crimes")
	# add title scene later
	
	var query_result = []
	
	#var rows = Database.db.select_rows("persons", "age = 40", ["id", "first_name"])
	var rows = Database.db.query("SELECT * FROM crimes")
	
	if not rows:
		return
		
	query_result = Database.db.query_result
	
	if query_result.size() == 0:
		print("No rows returned")
		return
	
	for row in query_result:
		print(row)
		var id = row["id"]
		var crime_type = row["crime_type"]
		var crime_date = row["crime_date"]
		var location_id = row["location_id"]
		
		var dict = {"id" : id, "crime_type" : crime_type, "crime_date" : crime_date, "location_id" : location_id}
		
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
