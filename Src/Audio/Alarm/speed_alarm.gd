extends AudioStreamPlayer3D





func _ready() -> void:
	RadarManager.finished_update.connect(_activate_deactivate_alarm)
	EndingManager.play_ending.connect(_ending_process)
	
func _ending_process(_junk) -> void:
	queue_free()
	
	
func _activate_deactivate_alarm() -> void:
	if RadarManager.active_incoming == true and !playing:
		play()
	
	if RadarManager.active_incoming == false:
		stop()
