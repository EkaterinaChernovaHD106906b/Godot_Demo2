extends ScrollContainer

@export var person_row_scene: PackedScene
@export var title_row_scene: PackedScene
@onready var table_container: VBoxContainer = $TableView
@export var left_panel_persons: ScrollContainer
@export var left_panel_crimes: ScrollContainer
@export var left_panel_locations: ScrollContainer
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
	var db_columns = left_panel_persons.get_table_columns("persons")
	var db_columns2 = left_panel_crimes.get_table_columns("crimes")
	var db_columns3 = left_panel_locations.get_table_columns("locations")
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
		var title_row = title_row_scene.instantiate()
		
		for key in keys:
			var label:= Label.new()
			var container: = title_row.get_node("MarginContainer").get_node("HBoxContainer")
			container.add_child(label)
			label.text = key
			label.add_theme_font_size_override("font_size", 10)
			label.add_theme_font_override("font", preload("res://CGXYZPCAlt-Regular.otf"))
			
		table_container.add_child(title_row)
		
		for row in query_result:
			var row_scene:= person_row_scene.instantiate()
			for key in keys:
				var label = Label.new() 
				var container: = row_scene.get_node("MarginContainer2").get_node("MarginContainer").get_node("HBoxContainer")
				container.add_child(label)
				label.text = str(row[key])
				label.add_theme_font_size_override("font_size", 10)
				label.add_theme_font_override("font", preload("res://CGXYZPCAlt-Regular.otf"))
				
			table_container.add_child(row_scene)		
			self.visible = true
			left_panel_persons.visible = false
			left_panel_crimes.visible = false
			left_panel_locations.visible = false
			change_table_button.disabled = true
			
			
	
	
	
