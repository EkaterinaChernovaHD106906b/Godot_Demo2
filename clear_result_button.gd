extends Button

@export var result_table: ScrollContainer
@export var persons_table: ScrollContainer
@export var change_table_button: TextureButton

func _on_pressed() -> void:
	result_table.clear_table()
	result_table.visible = false
	persons_table.visible = true
	change_table_button.disabled = false
	self.visible = false

	
