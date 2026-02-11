extends Area3D

@export var hint_label: Label

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		hint_label.visible = true
		
func _on_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		hint_label.visible = false
		
func _player_in_area() -> bool: 
	for b in self.get_overlapping_bodies():
		if b.is_in_group("player"):
			return true
	return false
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and _player_in_area():
		get_tree().change_scene_to_file("res://db.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
