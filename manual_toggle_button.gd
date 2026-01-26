extends Button

@onready var manual_panel = get_tree().current_scene.get_node("Root").get_node("ManualPanel")

func _pressed() -> void:
	manual_panel.visible = true
