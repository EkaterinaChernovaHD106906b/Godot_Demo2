extends ScrollContainer

@export var person_row_scene: PackedScene
@export var crime_row_scene: PackedScene
@export var persons_title_row_scene: PackedScene
@export var crimes_title_row_scene: PackedScene
@onready var table_container: VBoxContainer = $TableView
@export var left_panel_persons: ScrollContainer
@export var left_panel_crimes: ScrollContainer
@export var change_table_button: TextureButton
@onready var result_not_found_msg: Label

func _ready() -> void:
	load_persons()
	
func clear_table():
	if table_container.get_children():
		for child in table_container.get_children():
			child.queue_free()
			
func load_persons():
	clear_table()
	var bd_columns = left_panel_persons.get_table_columns("persons")
	var bd_columns2 = left_panel_crimes.get_table_columns("crimes")
	var dict = {}
	var current_scene_row
	
	var query_result = []
	var query: String = QueryValue.last_query
	if not query.strip_edges().is_empty():
		Database.db.query(query)
		
		query_result = Database.db.query_result
		
		if query_result.size() == 0:
			print("No rows returned")
			result_not_found_msg = Label.new()
			result_not_found_msg.text = 'No records found. Please check your query'
			result_not_found_msg.add_theme_color_override("font_color", Color.ROYAL_BLUE)
			result_not_found_msg.add_theme_font_size_override("font_size", 40)
			result_not_found_msg.add_theme_font_override("font", preload("res://ARCADECLASSIC.TTF"))
			table_container.add_child(result_not_found_msg)
			self.visible = true
			left_panel_persons.visible = false
			left_panel_crimes.visible = false
			return
			
		var keys = query_result[0].keys()
		
		if keys == bd_columns:
			var row_title_node = persons_title_row_scene.instantiate()
			row_title_node.set_column_name(bd_columns)
			table_container.add_child(row_title_node)
			
		elif keys == bd_columns2:
			var row_title_node = crimes_title_row_scene.instantiate()
			row_title_node.set_column_name(bd_columns2)
			table_container.add_child(row_title_node)
			
		for row in query_result:
			if keys == bd_columns:
				var id = row["id"]
				var first_name = row["first_name"]
				var last_name = row["last_name"]
				var age = row["age"]
				var occupation = row["occupation"]
				var location_id = row["location_id"]
				dict = {"id" : id, "first_name" : first_name, "last_name" : last_name, "age" : age, "occupation" : occupation, "location_id" : location_id  }
				current_scene_row = person_row_scene
				
			elif keys == bd_columns2:
				var id = row["id"]
				var crime_type = row["crime_type"]
				var crime_date = row["crime_date"]
				var location_id = row["location_id"]
				dict = {"id" : id, "crime_type" : crime_type, "crime_date" : crime_date, "location_id" : location_id}
				current_scene_row = crime_row_scene
				
			var row_node = current_scene_row.instantiate()
			row_node.set_data(dict)
			table_container.add_child(row_node)		
			self.visible = true
			left_panel_persons.visible = false
			left_panel_crimes.visible = false
			change_table_button.disabled = true
			
			
	
	
	
