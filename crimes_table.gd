extends ScrollContainer

@export var row_scene: PackedScene
@onready var table_container: VBoxContainer = $TableView
@export var left_panel: ScrollContainer
@export var title_row_scene: PackedScene

func _ready() -> void:
	load_crimes()
	
func clear_table():
	if table_container.get_children():
		for child in table_container.get_children():
			child.queue_free()
			
func load_crimes():
	clear_table()
	var query_result = []
	
	#var rows = Database.db.select_rows("persons", "age = 40", ["id", "first_name"])
	var rows = Database.db.query("SELECT * FROM crimes")
	
	if not rows:
		return
		
	query_result = Database.db.query_result
	
	if query_result.size() == 0:
		print("No rows returned")
		return
	
	var keys = query_result[0].keys()
	var title_row = title_row_scene.instantiate()
	
	
	for key in keys:
		var label:= Label.new()
		var container: = title_row.get_node("HBoxContainer")
		container.add_child(label)
		label.text = key
		label.add_theme_font_size_override("font_size", 10)
		label.add_theme_font_override("font", preload("res://CGXYZPCAlt-Regular.otf"))
		label.modulate = Color.BLACK
			
	table_container.add_child(title_row)

	for row in query_result:
		var person_row_scene = row_scene.instantiate()
		for key in keys:
			var label = Label.new() 
			var container: = person_row_scene.get_node("MarginContainer").get_node("HBoxContainer")
			container.add_child(label)
			label.text = str(row[key])
			label.add_theme_font_size_override("font_size", 10)
			label.add_theme_font_override("font", preload("res://CGXYZPCAlt-Regular.otf"))
			
			
		table_container.add_child(person_row_scene)
			
func get_table_columns(table_name: String) -> Array:
	var columns := []
	var result = Database.db.query("PRAGMA table_info(%s);" % table_name)
	
	if result:
		for row in Database.db.query_result:
			columns.append(row["name"])
	return columns
