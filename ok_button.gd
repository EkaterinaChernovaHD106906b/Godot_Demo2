extends Button

@export var click_sound: AudioStreamPlayer2D
@export var canvas: CanvasLayer

func _on_pressed() -> void:
	click_sound.play()
	canvas.visible = false
