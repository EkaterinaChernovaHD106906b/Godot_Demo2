extends Area3D

@export var canvas: CanvasLayer
@export var mouse_model: Node3D
@export var dialog_box: Panel


func _player_in_area() -> bool: 
	for b in self.get_overlapping_bodies():
		if b.is_in_group("player"):
			return true
	return false
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and _player_in_area():
		if canvas.visible == false:
			mouse_model.visible = true
			canvas.visible = true
			dialog_box.visible = true
			
		elif canvas.visible == true:
			mouse_model.visible = false
			canvas.visible = false
	
		
	
		
	
		
