extends Area3D

@export var canvas: CanvasLayer
@export var mouse_model: Node3D

func _player_in_area() -> bool: 
	for b in self.get_overlapping_bodies():
		if b.is_in_group("player"):
			return true
	return false
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and _player_in_area():
		mouse_model.visible = true
		canvas.visible = true
		
	
		
