extends AudioStreamPlayer3D





func _ready() -> void:
	HiddenButtonManager.intercept_button_pushed.connect(_launch_missile)
	EndingManager.play_ending.connect(_ending_process)
	
func _ending_process(_junk) -> void:
	queue_free()
	
	
func _launch_missile() -> void:
	if RadarManager.detection_object.current_radar_mode == RadarDetector.RadarMode.LOCKED:
		return
		
	play()
