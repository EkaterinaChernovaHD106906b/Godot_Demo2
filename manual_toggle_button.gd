extends Button

@onready var manual_panel = get_tree().current_scene.get_node("Root").get_node("ManualPanel")
@export var click_button_sound: AudioStreamPlayer2D

func _pressed() -> void:
	click_button_sound.play()
	manual_panel.visible = true
