extends TextureButton

@export var persons_table: ScrollContainer
@export var crimes_table: ScrollContainer

func _on_pressed() -> void:
	persons_table.visible = !persons_table.visible
	crimes_table.visible = !crimes_table.visible
	
