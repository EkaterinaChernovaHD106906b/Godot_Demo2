extends ScrollContainer

@export var row_scene: PackedScene
@export var title_row_scene: PackedScene
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
	
	var row_title_node = title_row_scene.instantiate()
	var bd_columns = left_panel.get_table_columns("persons")
	row_title_node.set_column_name(bd_columns)
	table_container.add_child(row_title_node)
	
	var query_result = []
	var query: String = QueryValue.last_query
	if not query.strip_edges().is_empty():
		Database.db.query(query)
		
		query_result = Database.db.query_result
		
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
			self.visible = true
			left_panel.visible = false
			
	
	
	
