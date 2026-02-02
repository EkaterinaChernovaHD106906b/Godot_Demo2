extends Label

@export var persons_table: ScrollContainer
@export var crimes_table: ScrollContainer

func _process(delta: float) -> void:
	if persons_table.visible:
		self.text = 'persons'
	elif crimes_table.visible:
		self.text = 'crimes'
