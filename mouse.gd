extends Node3D

@onready var area: = $Area3D
@onready var mouse_squeak: = $AudioStreamPlayer
@onready var label: = $InteractWithMouseLabel

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == 'Player':
		label.visible = true
		mouse_squeak.play()
		
func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == 'Player':
		label.visible = false
		mouse_squeak.stop()
		
