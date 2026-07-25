extends AudioStreamPlayer3D




func _ready() -> void:
	RadarManager.scanned_object.connect(_play_audio)
	
	
func _play_audio() -> void:
	play()
