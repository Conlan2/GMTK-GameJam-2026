extends AudioStreamPlayer3D




func _ready() -> void:
	RadarManager.scanned_object.connect(_play_audio)
	
	EndingManager.play_ending.connect(_ending_process)
	
func _ending_process(_junk) -> void:
	queue_free()
	
	
func _play_audio() -> void:
	play()
