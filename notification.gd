extends Control

@onready var panel = $Panel

func show_notification(text: String):
	$Panel/Label.text = text
	
	#start position
	position.y += 80
	modulate.a = 0.0
	
	var tween = create_tween()
	tween.tween_property(self, "position:y", position.y - 80, 0.8).set_trans(Tween.TRANS_CUBIC)\
		 .set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(self, "modulate:a", 1.0, 0.8)
		
	await get_tree().create_timer(3.0).timeout
	hide_notification()
	
func hide_notification():
	var tween = create_tween()
	
	tween.tween_property(self, "position:y", position.y + 80, 0.3)
	tween.parallel().tween_property(self, "modulatea:a", 0.0, 0.3)
	
	await  tween.finished
	queue_free()
	

	
