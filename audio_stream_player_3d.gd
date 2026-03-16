extends AudioStreamPlayer

var tracks = [
	preload("res://audio/Deep Focus Circuit3.mp3"),
	preload("res://audio/Deep Focus Circuit (2).mp3"),
	preload("res://audio/Deep Focus Circuit (3).mp3"),
	preload("res://audio/Deep Focus Circuit (4).mp3"),
	preload("res://audio/Deep Focus Circuit (18).mp3"),
	preload("res://audio/Deep Focus Circuit (21).mp3"),
	preload("res://audio/Deep Focus Circuit (33).mp3"),
	preload("res://audio/Deep Focus Circuit(00).mp3"),
	preload("res://audio/Deep Focus Loop3.mp3"),
	preload("res://audio/Deep Focus Loop12.mp3"),
	preload("res://audio/Deep Focus Loop (1).mp3"),
	preload("res://audio/Deep Focus Loop (3).mp3"),
	preload("res://audio/Deep Focus Loop.mp3"),
	preload("res://audio/Deep Focus Thread (1).mp3"),
	preload("res://audio/Deep Focus Thread.mp3")
]
var current_track_index: = 0

func  _ready() -> void:
	play_current_track()
	
func play_current_track():
	self.stream = tracks[current_track_index]
	self.play()
	fade_in_music()
	
func _on_track_finished():
	current_track_index += 1
	
	if current_track_index >= tracks.size():
		current_track_index = 0
		
	play_current_track()
	
func fade_in_music(duration: float = 4.0) -> void:
	self.volume_db = -80
	var tween = create_tween()
	tween.tween_property(self, "volume_db", 0, duration).set_trans(Tween.TRANS_LINEAR)
